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
        writeUsingOutputStream(m, n, ix, iy, tx, ty, stonesIndices);
    }
    private static void writeUsingOutputStream(int m, int n, int ix, int iy, int tx, int ty, String[] stonesIndices) {
        OutputStream os = null;
        try {
            os = new FileOutputStream(new File("./KB.pl"));

            StringBuilder outString = new StringBuilder();
            outString.append("im("+ix+","+iy+",[");
            for (int i = 0; i < stonesIndices.length; i = i + 2) {
                int x = Integer.parseInt(stonesIndices[i] + "");
                int y = Integer.parseInt(stonesIndices[i+1] + "");
                outString.append("["+x+","+y+"]," );
            }
            outString.deleteCharAt(outString.lastIndexOf(","));
            outString.append("],"+"s0"+")."+"\n");
            outString.append("t("+tx+","+ty+")."+"\n" );
            outString.append("m("+m+")."+"\n" );
            outString.append("n("+n+")."+"\n" );
            os.write(outString.toString().getBytes(), 0, outString.length());

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
}
