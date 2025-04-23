import java.util.Scanner;

public class FindMaxExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("몇 개의 숫자를 입력하시겠습니까? ");
        int n = scanner.nextInt();

        int max = Integer.MIN_VALUE; // 초기값을 매우 작은 값으로 설정
        for (int i = 0; i < n; i++) {
            System.out.printf("%d번째 숫자를 입력하세요: ", i + 1);
            int num = scanner.nextInt();
            if (num > max) {
                max = num;
            }
        }

        System.out.println("가장 큰 숫자는: " + max);

        scanner.close();
    }
}