public class Calcutator {
    private  double numFirst;
    private double numSecond;

    public Calcutator(double numFirst, double numSecond) {
        this.numFirst = numFirst;
        this.numSecond = numSecond;
    }

    public Calcutator() {
    }

    public double getNumFirst() {
        return numFirst;
    }

    public void setNumFirst(double numFirst) {
        this.numFirst = numFirst;
    }

    public double getNumSecond() {
        return numSecond;
    }

    public void setNumSecond(double numSecond) {
        this.numSecond = numSecond;
    }

    public String getAddition(double a, double b) {
        double result = a + b;
        return "" + result;
    }

    public String getSubtraction(double a, double b) {
        double result = a - b;
        return "" + result;
    }

    public String getMultiplication(double a, double b) {
        double result = a * b;
        return "" + result;
    }

    public String getDivision(double a, double b) {
        if (b == 0) {
            return "Không được chia cho 0";
        } else {
            double result = a / b;
            return  ""+result;
        }
    }
    public  String calculate(double a, double b, String operator) {
        String result="";
        switch (operator){
            case "+":
                result = getAddition(a,b);
                break;
            case "-":
                result = getSubtraction(a,b);
                break;
            case "*":
                result = getMultiplication(a,b);
                break;
            case "/":
                result = getDivision(a,b);
                break;
        }
        return result;
    }
}
