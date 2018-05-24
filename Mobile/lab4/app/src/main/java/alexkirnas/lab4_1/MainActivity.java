package alexkirnas.lab4_1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.media.MediaPlayer;
import android.net.Uri;
import android.view.View;
import android.widget.RadioGroup;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {

    VideoView videoPlayer;
    MediaPlayer audioPlayer;
    RadioGroup group;
    boolean choice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        choice = false;

        videoPlayer = (VideoView) findViewById(R.id.videoPlayer);
        group = (RadioGroup) findViewById(R.id.group);

        group.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
        {
            @Override
            public void onCheckedChanged (RadioGroup group, int checkedId) {
                if (checkedId == R.id.video) {
                    choice = false;
                    audioPlayer.stop();
                    try {
                        audioPlayer.prepare();
                        audioPlayer.seekTo(0);
                    }
                    catch (Throwable t) {
                    }
                    videoPlayer.setVisibility(View.VISIBLE);
                } else if (checkedId == R.id.audio) {
                    choice = true;
                    videoPlayer.stopPlayback();
                    videoPlayer.resume();
                    videoPlayer.setVisibility(View.GONE);

                }
            }
        });

        Uri myVideoUri= Uri.parse( "android.resource://" + getPackageName() + "/" + R.raw.video);
        videoPlayer.setVideoURI(myVideoUri);
        videoPlayer.setVisibility(View.VISIBLE);

        audioPlayer = MediaPlayer.create(this, R.raw.audio);
    }

    public void play(View view) {
        if(choice) {
            audioPlayer.start();
        }
        else {
            videoPlayer.start();
        }
    }

    public void pause(View view) {
        if(choice) {
            audioPlayer.pause();
        }
        else {
            videoPlayer.pause();
        }
    }

    public void stop(View view) {
        if(choice) {
            audioPlayer.stop();
            try {
                audioPlayer.prepare();
                audioPlayer.seekTo(0);
            }
            catch (Throwable t) {
            }
        }
        else {
            videoPlayer.stopPlayback();
            videoPlayer.resume();
        }
    }
}