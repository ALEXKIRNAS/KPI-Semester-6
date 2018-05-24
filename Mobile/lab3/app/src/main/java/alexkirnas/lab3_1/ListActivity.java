package alexkirnas.lab3_1;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

public class ListActivity extends AppCompatActivity {

    Database database;
    SQLiteDatabase db;
    ListView passwordList;
    Cursor passwordCursor;
    SimpleCursorAdapter passwordAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);

        passwordList = (ListView) findViewById(R.id.list);

        database = new Database(getApplicationContext());
    }

    @Override
    public void onResume() {
        super.onResume();

        db = database.getReadableDatabase();

        passwordCursor =  db.rawQuery("select * from "+ Database.table, null);
        String[] headers = new String[] {Database.columnPassword};
        passwordAdapter = new SimpleCursorAdapter(this, R.layout.list_item,
                passwordCursor, headers, new int[]{R.id.passwordValue}, 0);
        passwordList.setAdapter(passwordAdapter);
    }

    @Override
    public void onDestroy(){
        super.onDestroy();
        db.close();
        passwordCursor.close();
    }
}
