package com.example.shop.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = "com.example.shop.repository")	//해당경로에 있는 파일들을 다 메모리에 뜸
public class DataAccessConfig {

	
	
	/*
	 * sqlSessionFactory는 MySQL과 MyBatis를 연결할때 사용되며
	 * 스프링에서 사용할때는 sqlSessionFactoryBean을 이용한다.
	 */
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {

        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

        sessionFactory.setDataSource(dataSource);
        sessionFactory.setMapperLocations(
        		new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml")); //classpath: << src/main/resources

        return sessionFactory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}

