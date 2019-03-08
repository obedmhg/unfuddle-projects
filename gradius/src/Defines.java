import java.io.*;

public class Defines {
    /******* DECLARATION OF THE GAME VARIABLES *******/
    public final boolean DEBUG = true;
    
    /*** PHONE SPECIFIC PARAMETERS ***/
    public final int SCREEN_WIDTH = 240;
    public final int SCREEN_HEIGHT = 290;
    public final int SOFTKEY_HEIGHT = 35;
    public final int SOFTKEY_TOP = SCREEN_HEIGHT - SOFTKEY_HEIGHT;
    
    /*** COLOR DEFINES ***/
    public final int COLOR_SOFTKEY = 0xCEC5C5; //Grey
    public final int COLOR_WHITE = 0xFFFFFF; //White
    public final int COLOR_BLACK = 0x000000; //Black
    public final int COLOR_BLUE = 0x1C5FBA; //Blue
    public final int COLOR_RED = 0xF82F2F; //Red
    
    /*** GAME STATES ***/
    public final int STATE_LOADING = 0;
    public final int STATE_MAINMENU = 1;
    public final int STATE_LOADGAME = 2;
    public final int STATE_ACTIONPHASE = 3;
    public final int STATE_INGAMEMENU = 4;
    public final int STATE_OPTIONS = 5;
    public final int STATE_MESSAGE = 6;
    public final int STATE_QUIT = 7;
    
    /*** LOADING STEPS ***/
    public final int INITIAL_LOADING = 10;
    public final int GAME_LOADING = 10;
    
    /*** PHONE KEYS ***/
    public final int PHONEKEY_UP = -1;
    public final int PHONEKEY_DOWN = -2;
    public final int PHONEKEY_LEFT = -3;
    public final int PHONEKEY_RIGHT = -4;
    
    public final int PHONEKEY_SOFTL = -6;
    public final int PHONEKEY_SOFTR = -7;
    public final int PHONEKEY_FIRE = -5;
    
    /*** KEY VALUES ***/
    public final int DEFKEY_0 = 1;
    public final int DEFKEY_1 = 2;
    public final int DEFKEY_2 = 4;
    public final int DEFKEY_3 = 8;
    public final int DEFKEY_4 = 16;
    public final int DEFKEY_5 = 32;
    public final int DEFKEY_6 = 64;
    public final int DEFKEY_7 = 128;
    public final int DEFKEY_8 = 256;
    public final int DEFKEY_9 = 512;

    public final int DEFKEY_UP = 1024;
    public final int DEFKEY_DOWN = 2048;
    public final int DEFKEY_LEFT = 4096;
    public final int DEFKEY_RIGHT = 8192;
    public final int DEFKEY_UL = 5120;
    public final int DEFKEY_UR = 9216;
    public final int DEFKEY_DL = 6144;
    public final int DEFKEY_DR = 10240;
    
    public final int DEFKEY_POUND = 16384;
    public final int DEFKEY_STAR = 32768;
    
    public final int DEFKEY_SOFTL = 65536;
    public final int DEFKEY_SOFTR = 131072;
    public final int DEFKEY_FIRE = 262144;
    
    public final int DEFKEY_NONE =0;
    
    
    /*** MENUS ***/
    public final int MENU_FONT_SIZE = 8;
    public final int MENU_SHORT_SPACING = 4;
    public final int MENU_LONG_SPACING = 5;
    public final int MENU_ELEMENT_SIZE = 16;
    public final int MENU_ELEMENT_WIDTH = 95;
    
    public final String[] STR_MAIN_MENU = {"Start Game", "Controls", "Sound", "About", "Exit"};
    public final String[] STR_INGAME_MENU = {"Resume", "Restart", "Sound", "Main Menu", "Exit"};
   
    /*** DIALOG BOX ***/
    public final int DIALOG_WIDTH = 160; //115;
    public final int DIALOG_HEIGHT = 95;
    public final int DIALOG_X = (SCREEN_WIDTH - DIALOG_WIDTH) >> 1;
    public final int DIALOG_Y = (SOFTKEY_TOP - DIALOG_HEIGHT) >> 1;
    
    /*** STRINGS ***/
    public final String STR_EXIT_CONFIRMATION = "Do you want exit?";
    public final String STR_RESTART_CONFIRMATION = "Do you want restart the game?";
    public final String STR_MAINMENU_CONFIRMATION = "Do you want exit to Main Menu?";
    public final String STR_SOUND_CONFIRMATION = "Do you want sound?";
    public final String STR_TRYAGAIN_CONFIRMATION = "Do you want try again?";
    
    public final String STR_PAGE_ABOUT = "My first game based on Puyo by Carlos Rosas";
    public final String STR_PAGE_CONTROLS = "Use UP, 2 to rotate^the brick^^Use LEFT, 4, RIGHT, 6^to move the brick^^Use OK, 5 to^swap the colors^^Use DOWN, 8 to^speed up the fall.";
    
    
    /*** IMAGES ***/
    public final int ALPHA_VALUE = 0xFF00FF;
    
    public final String[] SOURCE_IMAGES = {"background.png", "g1_small.PNG", "g2_small.PNG", "g3_small.PNG", "speedUp.PNG", "shot.png", "metal-shot.png", "lava-shot.png", "enemy1.PNG", "explosion.PNG", "exp1.PNG", "exp2.PNG", "exp3.PNG", "exp4.PNG"};
    
    //IMAGES INDEXs
    public final int BACKGROUND = 0;
    public final int GRADIUS_L = 1;
    public final int GRADIUS_R=  2;
    public final int GRADIUS_F = 3;
    public final int SPEED = 4;
    public final int SINGLE_SHOT = 5;
    public final int METAL_SHOT = 6;
    public final int LAVA_SHOT = 7;
    public final int EMENY_KIND1 = 8;
    public final int EXPLOSION_KIND1= 9;
    public final int OWNEXPLOSION_1 = 10;
    public final int OWNEXPLOSION_2 = 11;
    public final int OWNEXPLOSION_3 = 12;
    public final int OWNEXPLOSION_4 = 13;
    
    
    
    
    
    public final int TOTAL_IMAGES = SOURCE_IMAGES.length;
    
    /*** INGAME DEFINES ***/
    public final int PIECE_WIDTH = 24;//12;
    public final int PIECE_HEIGHT = 24;//12;
    
    public final int BOARD_WIDTH = 6;//10;
    public final int BOARD_HEIGHT = 10;// 14;
    public final int BOARD_X = 2;//20;
    public final int BOARD_Y = 6;//20;
    
    public final int SPEED_ONE = 750;
    public final int SPEED_TWO = 300;
    public final int SPEED_THREE = 5;
    
    public final int IGM_MARQUEE_WIDTH = 180;
    public final int IGM_MARQUEE_HEIGHT = 140;
    public final int IGM_MARQUEE_X = (SCREEN_WIDTH - IGM_MARQUEE_WIDTH) >> 1;
    public final int IGM_MARQUEE_Y = (SOFTKEY_TOP - IGM_MARQUEE_HEIGHT) >> 1;
    
    public Defines()
    {
    }
    
    //my images for the car game
    public final String[] SOURCE_IMAGES_CC = {"car.png", "car2.png"};
    
}