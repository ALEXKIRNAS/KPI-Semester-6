package alexkirnas.lab2_1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity
    implements PasswordFragment.OnFragmentInteractionListener{

    PasswordFragment passwordFragment;
    ResultFragment resultFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        passwordFragment = (PasswordFragment) getSupportFragmentManager().findFragmentById(
                R.id.password_fragment
        );

        resultFragment = (ResultFragment) getSupportFragmentManager().findFragmentById(
                R.id.result_fragment
        );
    }

    @Override
    public void onButtonClicked() {
        String pass = passwordFragment.password.getText().toString();
        passwordFragment.password.setText("");
        resultFragment.showResult(pass);
    }


    @Override
    public void onPasswordChanged() {
        if (resultFragment != null)
            resultFragment.hideResult();
    }
}
