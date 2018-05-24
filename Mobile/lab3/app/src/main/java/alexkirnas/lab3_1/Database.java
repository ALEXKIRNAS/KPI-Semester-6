package alexkirnas.lab3_1;

import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase;
import android.content.Context;

public class Database extends SQLiteOpenHelper {
    private static final String databaseName = "passwordstore.db";
    private static final int schema = 1;
    static final String table = "passwords";

    public static final String columnID = "_id";
    public static final String columnPassword = "password";

    public Database(Context context) {
        super(context, databaseName, null, schema);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        db.execSQL("CREATE TABLE " + table + " (" +
                columnID + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                columnPassword + " TEXT);");
    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion,  int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + table);
        onCreate(db);
    }
}