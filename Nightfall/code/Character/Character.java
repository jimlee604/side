package Character;
import javax.swing.*;

/** The character class will represent all characters. */
public class Character {
    protected String _name;
    private ImageIcon _image;
    private int _gold = 0;
    public Character() {
        _image = new ImageIcon("../images/items/Unk.png");
    }
    public Character(String name) {
        _name = name;
        _image = new ImageIcon("../images/enemies/" + _name.toLowerCase() + ".png");
        if (_image == null) {
            _image = new ImageIcon("../images/items/Unk.png");
        }
    }
    public String getName() {
        return _name;
    }
    public boolean hasImage() {
        return _image != null;
    }
    public ImageIcon getImage() {
        return _image;
    }
    public int gold() {
        return _gold;
    }
    public void setGold(int gold) {
        _gold = gold;
    }
}