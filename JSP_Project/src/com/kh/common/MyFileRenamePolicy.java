package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// 인터페이스를 구현해야 함 => implements 키워드 사용
public class MyFileRenamePolicy implements FileRenamePolicy {

	// 반드시 미완성된 rename 이라는 추상메소드를 오버라이딩 해서 구현해야함!!
	// 기존의 파일을 전달받아서 파일명 수정작업 후에 수정된 파일을 반환시켜줄것임
	// 매개변수 : File 객체
	// 리턴값 : File 객체
	@Override
	public File rename(File originFile) {
		
		// 원본파일명 뽑기 => 매개변수로 전달받은 원본 파일로부터 (File 객체의 getName())
		String originName = originFile.getName(); // "aaa.jpg"
		
		// 수정파일명 만들기 (규칙) => 최대한 이름이 겹치지 않게!!
		// 파일이 업로드된 시간(년월일시분초) + 5자리 랜덤값 (10000 ~ 99999) + 확장자
		// 확장자 : 원본파일의 확장자 그대로 (원본파일명으로부터 뽑아낼것!)
		
		/*
		 * 원본명		   수정명
		 * aaa.jpg -> 20211126164850XXXXX.jpg 형태로 변환
		 */
		
		// 1. 파일이 업로드된 시간 추출 => String currentTime;
		// API 시간에 배웠던 SimpleDateFormat 활용
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 추출 => int ranNum;
		// API 시간에 배웠던 Math 활용
		int ranNum = (int)(Math.random() * 90000) + 10000; // 10000 ~ 99999
		
		// 3. 확장자 뽑기 => String ext;
		// String 의 lastIndexOf(찾고자하는문자열) 메소드 활용
		// 혹여나 파일명 중간에 . 이 포함될걸 대비해서 가장 마지막에 있는 . 기준으로 뽑아낼것
		// + substring 메소드
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 1 + 2 + 3 조합해서 수정파일명 변수에 담기
		String changeName = currentTime + ranNum + ext;
		
		// 기존파일을 수정된 파일명으로 적용시켜서 리턴
		return new File(originFile.getParent(), changeName);
	}
	
}






