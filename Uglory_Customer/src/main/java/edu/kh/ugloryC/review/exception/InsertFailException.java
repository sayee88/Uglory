package edu.kh.ugloryC.review.exception;

public class InsertFailException extends RuntimeException{
	
	public InsertFailException() {
		super("리뷰 삽입 실패ㅠ");
	}
	
	public InsertFailException(String message) {
		super(message);
	}

}

