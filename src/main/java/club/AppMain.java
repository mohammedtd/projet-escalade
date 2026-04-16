package club;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.persistence.autoconfigure.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

//@SpringBootApplication(scanBasePackages = {"club/web", "club/service", "club/dao"})
@SpringBootApplication(scanBasePackages ="club")

//@EntityScan("club/model")
//@EnableJpaRepositories("club/repository")
public class AppMain {

    public static void main(String[] args) {
        SpringApplication.run(AppMain.class, args);
    }

}
