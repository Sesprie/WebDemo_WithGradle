package chapter01.static_method;

public class NinenineTable {
    public static String printNineNineTable(){
        String result = "";
        for(int i = 1; i<10;i++){
            for(int j = 1; j < i+1; j++){
                result += j+"*"+i+"="+i*j+"&nbsp;&nbsp;&nbsp;";
            }
            result+="<br>";
        }
        return result;
    }
}
