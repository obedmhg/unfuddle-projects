import javax.microedition.lcdui.*;
import java.util.*;

public class GradiusPiece {
    public int PosX;
    public int PosY;
    public int boardPosX;
    public int boardPosY;
    public int Color;
    public boolean left;
    public boolean falling;
    public boolean destroy;
            
    /** Creates a new instance of puyoPiece */
    public GradiusPiece() {
        falling = true;
        destroy = false;
    }
}
