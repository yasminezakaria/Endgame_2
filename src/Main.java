import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

public class Main {
    public static void GenGrid (String grid){
        String[] gridSplit = grid.split(";");
        String[] sizeSplit = gridSplit[0].split(",");
        int m = Integer.parseInt(sizeSplit[0] + "");
        int n = Integer.parseInt(sizeSplit[1] + "");
        String[] iSplit = gridSplit[1].split(",");
        int ix = Integer.parseInt(iSplit[0] + "");
        int iy = Integer.parseInt(iSplit[1] + "");
        String[] tSplit = gridSplit[2].split(",");
        int tx = Integer.parseInt(tSplit[0] + "");
        int ty = Integer.parseInt(tSplit[1] + "");
        String[] stonesIndices = gridSplit[3].split(",");
        for (int i = 0; i < stonesIndices.length; i = i + 2) {
//ADD Stones here
        }
    }
    private static void writeUsingOutputStream(String data) {
        OutputStream os = null;
        try {
            os = new FileOutputStream(new File("./KB.pl"));
            os.write(data.getBytes(), 0, data.length());
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {

    }
}
