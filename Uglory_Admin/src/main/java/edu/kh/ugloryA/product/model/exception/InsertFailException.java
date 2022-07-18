package edu.kh.ugloryA.product.model.exception;

public class InsertFailException extends RuntimeException {
	
	public InsertFailException() {
		super("게시글 삽입 실패");
	}

}
