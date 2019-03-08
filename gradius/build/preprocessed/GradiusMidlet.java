
import javax.microedition.lcdui.Display;

public final class GradiusMidlet extends javax.microedition.midlet.MIDlet
{
    
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------

public GradiusMidlet()
{
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------

public void startApp()
{
	GradiusCanvas.m_midlet = this;

	//if(puyoCanvas.m_game == null)
	{
		new GradiusCanvas();
		Display.getDisplay(this).setCurrent(GradiusCanvas.m_game);
	}


	//puyoCanvas.m_paused = false;

	if(GradiusCanvas.m_thread == null)
	{
		GradiusCanvas.m_thread = new Thread(GradiusCanvas.m_game);
		GradiusCanvas.m_thread.start();
	}
        
	//Game.m_game.UpdateState(Game.m_game.m_sm_depth, StateMachine.Resume);

}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------

    public void pauseApp()
    {
            //Game.m_paused = true;
            //Game.m_game.UpdateState(Game.m_game.m_sm_depth, StateMachine.Suspend);
    }


//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------

    public void destroyApp(boolean unconditionnal)
    {
            Display.getDisplay(this).setCurrent(null);

            notifyDestroyed();
    }
}
