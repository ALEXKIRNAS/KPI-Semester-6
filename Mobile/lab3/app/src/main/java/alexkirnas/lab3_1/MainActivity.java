package alexkirnas.lab3_1;

import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    int Input;
    Switch switchPassword;
    EditText password;
    Button addButton;
    Button showButton;
    Button deleteButton;
    Database database;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        switchPassword = (Switch) findViewById(R.id.switchPass);
        password = (EditText) findViewById(R.id.password);
        addButton = (Button) findViewById(R.id.addButton);
        showButton = (Button) findViewById(R.id.showButton);
        deleteButton = (Button) findViewById(R.id.deleteButton);

        Input = password.getInputType();
        switchPassword.setOnCheckedChangeListener( new Switch.OnCheckedChangeListener(){
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked) {
                    password.setInputType(InputType.TYPE_CLASS_TEXT);
                }
                else {
                    password.setInputType(Input);
                }
            }
        });

        addButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                add(view);
            }
        });
        showButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                show(view);
            }
        });
        deleteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                delete(view);
            }
        });

        database = new Database(getApplicationContext());
    }

    public void add(View view) {
        if(password.getText().toString().equals(""))
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
            builder.setTitle("Помилка");
            String message="Будь ласка введіть пароль";
            builder.setMessage(message);
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int id) {
                    dialog.cancel();
                }
            });

            builder.show();
        }
        else {
            db = database.getReadableDatabase();
            Cursor cursor = db.rawQuery("select * from " +
                    Database.table + " where " + Database.columnPassword + " = '" +
                    password.getText().toString() +"'" , null);
            int num = cursor.getCount();
            db.close();
            cursor.close();
            if(num != 0)
            {
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setTitle("Помилка");
                String message="Пароль '" + password.getText().toString() + "' вже є в базі даних!";
                builder.setMessage(message);
                builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });

                builder.show();
            }
            else {
                ContentValues cv = new ContentValues();
                cv.put(Database.columnPassword, password.getText().toString());

                db = database.getWritableDatabase();
                db.insert(Database.table, null, cv);
                db.close();
                password.setText("");
                Toast.makeText(getApplicationContext(), "Дані успішно додано!",
                        Toast.LENGTH_SHORT).show();
            }
        }
    }

    public void show(View view)
    {
        db = database.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Database.table , null);
        int num = cursor.getCount();
        db.close();
        cursor.close();
        if(num == 0)
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
            builder.setTitle("Помилка");
            String message="База даних порожня!";
            builder.setMessage(message);
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int id) {
                    dialog.cancel();
                }
            });

            builder.show();
        }
        else
        {
            Intent intent = new Intent(this, ListActivity.class);
            startActivity(intent);
        }
    }

    public void delete(View view)
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
        String message="Ви впевнені що хочете видалити всі дані?";
        builder.setMessage(message);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                db = database.getWritableDatabase();
                db.execSQL(" DELETE FROM " + Database.table);
                db.close();
                Toast.makeText(getApplicationContext(), "Дані успішно видалено!",
                        Toast.LENGTH_SHORT).show();
            }
        });
        builder.setNegativeButton("CANCEL",null);
        builder.show();
    }
}
