import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import org.dyno.visual.swing.layouts.Constraints;
import org.dyno.visual.swing.layouts.GroupLayout;
import org.dyno.visual.swing.layouts.Leading;

//VS4E -- DO NOT REMOVE THIS LINE!
public class Elisa extends JFrame {

	private final static String masterQuestion = "Elisa, estas ahi?, responde por favor, estamos esperandote";
	private final static String partOfMQ = "Elisa, estas ahi?";
	private String[] elisaAns = { "Aqui estoy...\n", "Buu...\n",
			"Que quieres!?\n", "No Estoy de humor!!\n" };
	private String[] elisaNonAns = { "No quiero jugar contigo!!!\n",
			"Muerete!!\n", "Dejame en paz!\n", "No te entiendo..\n" };
	private int counter = 1;
	private boolean isAsking = false;
	private String response = "";

	private static final long serialVersionUID = 1L;
	private JTextField input;
	private JTextArea output;
	private JScrollPane jScrollPane0;
	private JButton responde;
	private static final String PREFERRED_LOOK_AND_FEEL = "javax.swing.plaf.metal.MetalLookAndFeel";

	public Elisa() {
		initComponents();
	}

	private void initComponents() {
		setLayout(new GroupLayout());
		add(getInput(), new Constraints(new Leading(26, 264, 10, 10),
				new Leading(31, 10, 10)));
		add(getJScrollPane0(), new Constraints(new Leading(25, 262, 10, 10),
				new Leading(68, 136, 10, 10)));
		add(getJButton0(), new Constraints(new Leading(109, 10, 10),
				new Leading(205, 10, 10)));
		setSize(320, 240);
	}

	private JButton getJButton0() {
		if (responde == null) {
			responde = new JButton();
			responde.setText("Responde!");
			responde.addActionListener(new ActionListener() {

				public void actionPerformed(ActionEvent event) {
					respondeActionActionPerformed(event);
				}
			});
		}
		return responde;
	}

	private JTextField getInput() {
		if (input == null) {
			input = new JTextField();
			input.addKeyListener(new KeyAdapter() {

				public void keyTyped(KeyEvent event) {
					inputKeyKeyTyped(event);
				}
			});
		}
		return input;
	}

	private JScrollPane getJScrollPane0() {
		if (jScrollPane0 == null) {
			jScrollPane0 = new JScrollPane();
			jScrollPane0.setViewportView(getJTextArea0());
		}
		return jScrollPane0;
	}

	private JTextArea getJTextArea0() {
		if (output == null) {
			output = new JTextArea();
		}
		return output;
	}

	private static void installLnF() {
		try {
			String lnfClassname = PREFERRED_LOOK_AND_FEEL;
			if (lnfClassname == null)
				lnfClassname = UIManager.getCrossPlatformLookAndFeelClassName();
			UIManager.setLookAndFeel(lnfClassname);
		} catch (Exception e) {
			System.err.println("Cannot install " + PREFERRED_LOOK_AND_FEEL
					+ " on this platform:" + e.getMessage());
		}
	}

	/**
	 * Main entry of the class. Note: This class is only created so that you can
	 * easily preview the result at runtime. It is not expected to be managed by
	 * the designer. You can modify it as you like.
	 */
	public static void main(String[] args) {
		installLnF();
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				Elisa frame = new Elisa();
				frame.setDefaultCloseOperation(Elisa.EXIT_ON_CLOSE);
				frame.setTitle("Elisa");
				frame.getContentPane().setPreferredSize(frame.getSize());
				frame.pack();
				frame.setLocationRelativeTo(null);
				frame.setVisible(true);
			}
		});
	}

	private void respondeActionActionPerformed(ActionEvent event) {
		if (response.equals("")) {
			JOptionPane.showMessageDialog(this, getResp(elisaNonAns));
		} else {
			output.setText(output.getText() + "\n" + response);
			response = "";
			counter = 1;
			isAsking = false;
		}
	}

	private void inputKeyKeyTyped(KeyEvent event) {
		if (event.getKeyChar() == '>') {
			if (isAsking == true) {
				isAsking = false;
			} else {
				isAsking = true;
			}
			event.setKeyChar('\0');
			return;
		}
		if (isAsking == true && counter < masterQuestion.length()) {
			if (event.getKeyChar() == '\b' && counter > 0) {
				counter = counter - 1;
				response = response.substring(0, response.length() - 1);
			} else {
				response = response + event.getKeyChar();
				input.setText(masterQuestion.substring(0, counter));
				counter++;
			}
			event.setKeyChar('\0');
		}
		if (input.getText().equals(partOfMQ)) {
			JOptionPane.showMessageDialog(this, getResp(elisaAns));
		}
	}

	private String getResp(String[] toGet) {
		Random r = new Random();
		r.setSeed(System.currentTimeMillis());
		return toGet[r.nextInt(toGet.length - 1)];
	}
}
