package dimadon.business.tienda_don_doug_dimmadome;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
public class TiendaDonDougDimmadomeApplication {

	public static void main(String[] args) {

		Dotenv dotenv = Dotenv.load();

		System.setProperty("DB_URL", dotenv.get("DB_URL"));
		System.setProperty("DB_USERNAME", dotenv.get("DB_USERNAME"));
		System.setProperty("DB_PASSWORD", dotenv.get("DB_PASSWORD"));
		System.setProperty("RENIEC_API_TOKEN", dotenv.get("RENIEC_API_TOKEN"));

		SpringApplication.run(TiendaDonDougDimmadomeApplication.class, args);

	}

}
