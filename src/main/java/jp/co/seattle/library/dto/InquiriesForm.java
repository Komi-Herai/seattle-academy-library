package jp.co.seattle.library.dto;

	import org.springframework.context.annotation.Configuration;

import lombok.Data;

	@Configuration
	@Data
	public class InquiriesForm {

		private String name;

		private String email;

		private String contents;

		public InquiriesForm() {

		}

		public InquiriesForm (String name, String email, String contents) {
			this.name = name;
			this.email = email;
			this.contents = contents;
		}
	}
