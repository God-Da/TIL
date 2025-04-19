public import java.util.Scanner;

public class FactorialExample {
    // 팩토리얼을 계산하는 재귀 함수
    public static int factorial(int n) {
        if (n == 0 || n == 1) { // 0! = 1, 1! = 1
            return 1;
        }
        return n * factorial(n - 1); // 재귀 호출
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 입력 받기
        System.out.print("정수를 입력하세요 (0 이상의 값): ");
        int num = scanner.nextInt();

        // 유효성 검사
        if (num < 0) {
            System.out.println("음수는 팩토리얼을 계산할 수 없습니다.");
        } else {
            // 로직 실행 및 출력
            int result = factorial(num);
            System.out.printf("입력한 %d의 팩토리얼은 %d입니다.%n", num, result);
        }

        scanner.close();
    }
} {
    
}
