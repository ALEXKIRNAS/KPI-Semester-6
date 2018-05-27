package alexkirnas.lab1_1;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Switch;

public class MainActivity extends AppCompatActivity {

    int Input;
    Switch switchPassword;
    EditText password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        switchPassword = (Switch) findViewById(R.id.switchPass);
        password = (EditText) findViewById(R.id.password);
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
    }

    public void sendMessage(View view) {
        AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
        builder.setTitle("Пароль");
        String message = password.getText().toString();
        password.setText("");

        builder.setMessage(message);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });

        builder.show();
    }
}
