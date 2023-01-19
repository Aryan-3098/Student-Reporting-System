package com.student.Management;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@Configuration
@EnableElasticsearchRepositories(basePackages = "com.student.Management.rest")
@ComponentScan(basePackages = { "com.student.Management" })
public class ElasticsearchClientConfig extends AbstractElasticsearchConfiguration {
	@Override
	@Bean
	public RestHighLevelClient elasticsearchClient() {

		ClientConfiguration clientConfiguration = ClientConfiguration.builder()
				.connectedTo("student-management.es.asia-south1.gcp.elastic-cloud.com:9243").usingSsl()
				.withBasicAuth("elastic", "cFdhOcCmofeYY5sxwkXO3se6").build();

		return RestClients.create(clientConfiguration).rest();
	}
}
