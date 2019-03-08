import java.io.*;
import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import java.util.*;
import javax.microedition.lcdui.game.GameCanvas;
import javax.microedition.lcdui.game.Sprite;

public class GradiusCanvas extends GameCanvas implements Runnable {
    
    /*** CLASS WITH ALL THE DEFINITIONS ***/
    public static Defines DEF = new Defines();
    
    /*** GAME CORE VARIABLES ***/
    public static Sprite gradius;
    public Image g = loadImage(DEF.GRADIUS_L);
    public Image g1 = loadImage(DEF.GRADIUS_R);
    public Image g2 = loadImage(DEF.GRADIUS_F);
    public Image singShotImg = loadImage(DEF.SINGLE_SHOT);
    public Image metalShot = loadImage(DEF.METAL_SHOT);
    public Image lavaShot = loadImage(DEF.LAVA_SHOT);
    public Image enemy = loadImage(DEF.EMENY_KIND1);
    public Image explosion = loadImage(DEF.EXPLOSION_KIND1);
    public Image ownExplosion1 = loadImage(DEF.OWNEXPLOSION_1);
    public Image ownExplosion2 = loadImage(DEF.OWNEXPLOSION_2);
    public Image ownExplosion3 = loadImage(DEF.OWNEXPLOSION_3);
    public Image ownExplosion4 = loadImage(DEF.OWNEXPLOSION_4);
    public Sprite speedSprite;
    public Sprite shotSprite;
    public Sprite enemySprite;
    
    public static GradiusMidlet m_midlet;
    public static GradiusCanvas m_game;
    public static Thread m_thread;
    
    public Graphics m_graphics;
    public boolean needRefresh;
    public int gameState;
    public int prevState;
    public int nextState;
    public int loadProgress;
    public boolean isPageMessage;
    public boolean debugActive;
    public boolean soundEnabled;
    public String strDialog;
    public String strPage;
    public String m_Message;
    public Image[] gameImages = new Image[DEF.TOTAL_IMAGES];
    public Image background = loadImage(DEF.BACKGROUND);
    {
        gradius = new Sprite(g2,g2.getWidth(), g2.getHeight());
        gradius.defineReferencePixel((int) Math
				.floor(g2.getWidth() / 2), (int) Math.floor(g2
				.getHeight() / 2));
        Image speedImg = loadImage(DEF.SPEED);
        speedSprite = new Sprite(speedImg);
        enemySprite =  new Sprite(enemy);
        
    }
    public long currTime;
    // Determine if an block can be controlled by the player
    // Determine if an block is active
    public int fallSpeed;
    public int x = 50;
    public int y = 120;
    public int ship = 0;
    public int speed = 5;
    public int speedX = 20;
    public int speedY = 20;
    public int shotX = 0;
    public int shotY = 0;
    public int enemyX = 30;
    public int enemyY = -20;
    public int enemySpeed = 5;
    public boolean existShot = false;
    public int kindOfShot = 0;
            
    /*** MENU HANDLING ***/
    public int currItem;
    
    
    /*** KEYS VARIABLES ***/
    public int keyPressed = 0;
    public int currentKeyPressed = 0;
    
    // Constructor
    public GradiusCanvas() {
        super(false);
        imageArray [0] = ownExplosion1;
        imageArray [1] = ownExplosion2;
        imageArray [2] = ownExplosion3;
        imageArray [3] = ownExplosion4;
        
        
        m_game = this;
        gameState = DEF.STATE_ACTIONPHASE;
    }
    
    // Run
    public void run(){
        
        
        while(m_thread != null){
            try{
                
                Thread.sleep(50);
                
                repaint();
                serviceRepaints();
                
                if ( gameState == DEF.STATE_QUIT ){
                    m_thread = null;
                    System.gc();
                }
                
            } catch (Exception err){
                System.out.println("Error in main loop : " + err);
            }
        }
        // Ends the Application
        m_midlet.destroyApp(true);
    }
    
    // Paint
    public void paint(Graphics g) {
        
        m_graphics = g;
        keyPressed = currentKeyPressed;
        // Update the current state
        updateState();
        
        // Draw the current state
        drawState();
    }
    
    // Called when a key is pressed.
    protected  void keyPressed(int keyCode) {
        int keyFlag = CanvasToGeneric(keyCode);
	currentKeyPressed |= keyFlag;
    }
    
    // Called when a key is released.
    protected  void keyReleased(int keyCode) {
        int keyFlag = CanvasToGeneric(keyCode);
	currentKeyPressed &= ~keyFlag;
    }
    
    // Called when an interrupt has ended
    public synchronized void showNotify(){
        
    }

    // Called when an interrupt has started
    public synchronized void hideNotify(){
        
    }
    
    /***************************************/
    /*** START OF THE NON NATIVE METHODS ***/
    /***************************************/
    
    // Validate if the determinated key was pressed
    public boolean wasKeyPressed(int keyFlag)
    {
        return (keyPressed & keyFlag) != 0;
    }
    
    private int CanvasToGeneric(int keyCode)
    {
        if(keyCode >= Canvas.KEY_NUM0 && keyCode <= Canvas.KEY_NUM9)
	{
		return 1 << (keyCode-Canvas.KEY_NUM0);
	}
	else
	{
		if(keyCode == DEF.PHONEKEY_UP) return DEF.DEFKEY_UP;
                else if(keyCode == DEF.PHONEKEY_DOWN) return DEF.DEFKEY_DOWN;
                else if(keyCode == DEF.PHONEKEY_LEFT) return DEF.DEFKEY_LEFT;
                else if(keyCode == DEF.PHONEKEY_RIGHT) return DEF.DEFKEY_RIGHT;
                
		else if(keyCode == Canvas.FIRE) return DEF.DEFKEY_FIRE;
                else if(keyCode == Canvas.KEY_POUND) return DEF.DEFKEY_POUND;
                else if(keyCode == DEF.PHONEKEY_SOFTL) return DEF.DEFKEY_SOFTL;
                else if(keyCode == DEF.PHONEKEY_SOFTR) return DEF.DEFKEY_SOFTR;
                
		return DEF.DEFKEY_NONE;
	}
    }   
    
    // Clear the screen
    public void clearScreen(){
        m_graphics.setClip(0, 0, DEF.SCREEN_WIDTH, DEF.SCREEN_HEIGHT);
        m_graphics.setColor(DEF.COLOR_BLACK);
        m_graphics.fillRect(0, 0, DEF.SCREEN_WIDTH, DEF.SCREEN_HEIGHT);
        m_graphics.drawImage(background, 0, 0, 0);
    }
    
    // Method that load an Image and processes the alpha value on it
    public Image loadImage (int src){
        if (DEF.DEBUG)
            System.out.println("loadImage - src : " + src);
        
        try{
            Image srcImage = Image.createImage("/" + DEF.SOURCE_IMAGES[src]); // Create a new Image object
            
            int srcW = srcImage.getWidth();
            int srcH = srcImage.getHeight();
            
            int srcRGB[] = new int[srcW * srcH];
            int dstRGB[] = new int[srcW * srcH];
            
            srcImage.getRGB(srcRGB, 0, srcW, 0, 0, srcW, srcH);  

            for (int _counter = 0; _counter < (srcW * srcH); _counter++){
                dstRGB[_counter] = ((srcRGB[_counter] & 0x00FFFFFF) == DEF.ALPHA_VALUE)? srcRGB[_counter] + DEF.ALPHA_VALUE : srcRGB[_counter];
            }
            
            Image dstImage = Image.createRGBImage(dstRGB, srcW, srcH, true);
            return dstImage;
        } catch (Exception Err){
            System.out.println("Error loading image " + src + " : " + Err);
        }
        return null;
    }
    
    // Update the current state
    public void updateState(){
        if (DEF.DEBUG)
            System.out.println("updateState - gameState : " + gameState);
        
        if (gameState == DEF.STATE_LOADING) {
            //updateLoading();
        } else if (gameState == DEF.STATE_MAINMENU) {
            //updateMainMenu();
        } else if (gameState == DEF.STATE_LOADGAME) {
           // updateLoadGame();
        } else if (gameState == DEF.STATE_ACTIONPHASE) {
            updateActionPhase();
        } else if (gameState == DEF.STATE_INGAMEMENU) {
           // updateInGameMenu();
        } else if (gameState == DEF.STATE_MESSAGE) {            
            //updateMessage();
        } else if (gameState == DEF.STATE_OPTIONS) {
            //updateOptions();
        } 
    }
    
    // Draw the current state
    private void drawState(){
        if (DEF.DEBUG)
            System.out.println("drawState - gameState : " + gameState);
        
        if (gameState == DEF.STATE_LOADING) {
            //drawLoading();
        } else if (gameState == DEF.STATE_MAINMENU) {
            //drawMainMenu();
        } else if (gameState == DEF.STATE_LOADGAME) {
            //drawLoadGame();
        } else if (gameState == DEF.STATE_ACTIONPHASE) {
            drawActionPhase();
        } else if (gameState == DEF.STATE_INGAMEMENU) {
            //drawInGameMenu();
        } else if (gameState == DEF.STATE_MESSAGE) {            
            //drawMessage();
        } else if (gameState == DEF.STATE_OPTIONS) {
            //drawOptions();
        }
    }
    // Update the action phase
    public void updateActionPhase(){
        if (!debugActive){
            if ((System.currentTimeMillis() - currTime) >= fallSpeed)
            {
                    currTime = System.currentTimeMillis();
                    needRefresh = true;   
            }
        }
        moveShip();
        checkCollisions();
        
    }        

    
    public void moveShip(){

        if (isUpPressed() && isLeftPressed() && x>15 && y>20){
            y -= speed;
            x -= speed;
            gradius.setImage(g, g.getWidth(), g.getHeight());
        }else if (isUpPressed() && isRightPressed() && x<230 && y>20){
            y -= speed;
            x += speed;
            gradius.setImage(g1, g1.getWidth(), g1.getHeight());
        }else if (isDownPressed() && isLeftPressed() && x>15 && y<260){
            y += speed;
            x -= speed;
            gradius.setImage(g, g.getWidth(), g.getHeight());
        }else if (isDownPressed() && isRightPressed() && x<230 && y<260){
            y += speed;
            x += speed;
            gradius.setImage(g1, g1.getWidth(), g1.getHeight());
        }else if(isDownPressed() && y<260){
            y += speed;
            gradius.setImage(g2, g2.getWidth(), g2.getHeight());
        }else if(isUpPressed() && y>20){
            y -= speed;
            gradius.setImage(g2, g2.getWidth(), g2.getHeight());
        }else if(isLeftPressed() && x>15){
            x -= speed;
            gradius.setImage(g, g.getWidth(), g.getHeight());
        }else if(isRightPressed() && x<230){
            x += speed;
            gradius.setImage(g1, g1.getWidth(), g1.getHeight());
        }else {
            gradius.setImage(g2, g2.getWidth(), g2.getHeight());
        }
         
    }
    
    
    private boolean isUpPressed() {
        return (keyPressed & DEF.DEFKEY_UP) == DEF.DEFKEY_UP;
    }
    
    private boolean isDownPressed() {
        return (keyPressed & DEF.DEFKEY_DOWN) == DEF.DEFKEY_DOWN;
    }
    
    private boolean isLeftPressed() {
        return (keyPressed & DEF.DEFKEY_LEFT) == DEF.DEFKEY_LEFT;
    }
    
    private boolean isRightPressed() {
        return (keyPressed & DEF.DEFKEY_RIGHT) == DEF.DEFKEY_RIGHT;
    }
    
    private boolean isFivePressed(){
        return (keyPressed & DEF.DEFKEY_5) == DEF.DEFKEY_5;
    }
  
    private boolean isSevenPressed(){
        return (keyPressed & DEF.DEFKEY_7) == DEF.DEFKEY_7;
    }
    
    private boolean isNinePressed(){
        return (keyPressed & DEF.DEFKEY_9) == DEF.DEFKEY_9;
    }

    
    // Draw the action phase
    public void drawActionPhase(){
        if (needRefresh) {
            clearScreen();
            if(speed==5){
                speedSprite.setRefPixelPosition(speedX, speedY);
                speedSprite.paint(m_graphics);
            }
            gradius.setRefPixelPosition(x, y);
            gradius.paint(m_graphics);
            fire();
            makeEnemies();
        }
    }

    
    private static int imageCounter = 0;
    
    private Image[] imageArray= new Image[4];
    
    
    
    public void checkCollisions(){
        if(gradius.collidesWith(speedSprite, false) && 
                        gradius.getRefPixelY() == speedSprite.getRefPixelY()){
            speed = 10;
        }
        
        if(shotSprite !=  null && shotSprite.collidesWith(enemySprite, false)){
            enemySprite.setImage(explosion, explosion.getWidth(), explosion.getHeight());
        }
        
        if(gradius.collidesWith(enemySprite, false)){
            imageCounter++;
            imageCounter %= 4;
            
            gradius.setImage(imageArray[imageCounter], imageArray[imageCounter].getWidth(), imageArray[imageCounter].getHeight());
            
        }
        
    }
    
    public void fire(){
        if(isFivePressed()){
            fire(DEF.SINGLE_SHOT);
        }else if (isSevenPressed()){
            fire(DEF.LAVA_SHOT);
        }else if(isNinePressed()){
            fire(DEF.METAL_SHOT);
        }
        
        if(shotSprite!= null && shotSprite.getRefPixelY()>0){
            int shotx = shotSprite.getRefPixelX();
            int shoty = shotSprite.getRefPixelY()- 15;
            shotSprite.setRefPixelPosition(shotx, shoty);
            shotSprite.paint(m_graphics);
        }
        
    }
    
    public void fire(int kind){
        if(kind == DEF.SINGLE_SHOT) {
            shotSprite =  new Sprite(singShotImg);
            shotSprite.setRefPixelPosition(x, y);
            shotSprite.paint(m_graphics);
        } 
        if (kind == DEF.LAVA_SHOT){
            shotSprite =  new Sprite(lavaShot);
            shotSprite.setRefPixelPosition(x, y);
            shotSprite.paint(m_graphics);
        }
        
        if (kind == DEF.METAL_SHOT){
            shotSprite =  new Sprite(metalShot);
            shotSprite.setRefPixelPosition(x, y);
            shotSprite.paint(m_graphics);
        }
    }
    
    
    
    
    
    public void makeEnemies(){
        if(enemyY>280){
            enemyY = 0;
            enemySprite =  new Sprite(enemy);
            Random random = new Random();
            enemyX = random.nextInt(220);
        }else{
            enemyY += enemySpeed;
        }
        enemySprite.setRefPixelPosition(enemyX, enemyY);
        enemySprite.paint(m_graphics);
        
    }
    
    
    
}
