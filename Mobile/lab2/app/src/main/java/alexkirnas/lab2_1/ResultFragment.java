package alexkirnas.lab2_1;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class ResultFragment extends Fragment {

    View resultView;
    TextView passwordValue;

    public ResultFragment() {
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_result, container, false);
    }
    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        resultView = view.findViewById(R.id.result1_fragment);
        passwordValue = view.findViewById(R.id.password_value);
    }

    public void showResult(String password){
        resultView.setVisibility(View.VISIBLE);
        password = "Пароль: " + password;
        passwordValue.setText(password);
    }

    public void hideResult(){
        resultView.setVisibility(View.GONE);
    }

}