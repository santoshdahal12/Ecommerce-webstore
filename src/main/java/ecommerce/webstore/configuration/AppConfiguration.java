package ecommerce.webstore.configuration;

import java.util.Locale;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@Configuration
@EnableWebSecurity
@EnableAspectJAutoProxy
public class AppConfiguration extends WebSecurityConfigurerAdapter {
	
	/*@Value("${spring.profiles.active}")
	private String env;*/

	@Autowired
	DataSource dataSource;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select member_name,password, 1 as enabled from users where member_name=?")
				.authoritiesByUsernameQuery(
						"select u1.member_name, u2.authority from users u1, authorities u2 where u1.member_name = u2.member_name and u1.member_name =?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*
		if (!env.equals("dev"))
            http.requiresChannel().anyRequest().requiresSecure();
*/
 
		http.authorizeRequests().antMatchers("/", "/resources/**","/dashboard", "/dashboard1", "/memberform", "/membersaved","/delete_product_r", "/success")
				.permitAll().anyRequest().authenticated().

				and().formLogin().defaultSuccessUrl("/dashboard1").loginPage("/login").permitAll();
				/*.and().logout().logoutSuccessUrl("/login").permitAll();*/
	}
	
	// for query based multiple user authorization

	/*
	 * @Autowired public void configureGlobal(AuthenticationManagerBuilder auth)
	 * throws Exception {
	 * auth.inMemoryAuthentication().withUser("admin").password("admin").roles(
	 * "USER"); }
	 */
}
