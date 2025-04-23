import java.util.Scanner;

public class MultiplicationTableExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("구구단의 숫자를 입력하세요: ");
        int num = scanner.nextInt();

        System.out.printf("%d단:%n", num);
        for (int i = 1; i <= 9; i++) {
            System.out.printf("%d x %d = %d%n", num, i, num * i);
        }

        scanner.close();
    }
}