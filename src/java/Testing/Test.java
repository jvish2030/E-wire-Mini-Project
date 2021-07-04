/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Testing;

import com.java.ConPool.DBUtils;
import static com.java.ConPool.DBUtils.connect;


/**
 *
 * @author jatin
 */
public class Test {

    public static void main(String[] args) {
        System.out.println("conn................"+connect()); 
    }

}
