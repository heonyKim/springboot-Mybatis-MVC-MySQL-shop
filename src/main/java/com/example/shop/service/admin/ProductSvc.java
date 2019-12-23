package com.example.shop.service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.shop.model.Product;
import com.example.shop.repository.ProductRepository;
import com.example.shop.utils.FtpInfo;

@Service
public class ProductSvc {
	@Autowired
	private ProductRepository productRep;
	
	public List<Product> productList(){
		return productRep.productList();
	}
	
	public String productInsert(Product product) {
		String resultStr = "";
		
		try {
			int result = productRep.productInsert(product);
			
			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultStr ="fail";
		}
		
		return resultStr;
	}
	
	public String productUpdate(Product product) {
		String resultStr = "";
		
		try {
			int result = productRep.productUpdate(product);

			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			resultStr ="fail";
			e.printStackTrace();
		}
		
		return resultStr;
	}
	
	public String productDelete(Product product) {
		String resultStr = "";
		
		try {
			int result = productRep.productDelete(product);

			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			resultStr ="fail";
			e.printStackTrace();
		}
		
		return resultStr;
	}
	
	public String productUpload(MultipartFile file) throws Throwable {
		String returnStr = "";
		
		UUID uuid = UUID.randomUUID();
		String uuidFileName = uuid + "_" + file.getOriginalFilename();
		
		File convertFile = new File(uuidFileName);
		convertFile.createNewFile();
		
		FileOutputStream fos = new FileOutputStream(convertFile);
		fos.write(file.getBytes());
		fos.close();
		
		try {
			FTPClient ftp = new FTPClient();
			FileInputStream fis = new FileInputStream(convertFile);

			try {
				ftp.setControlEncoding("UTF-8");
				ftp.connect("145.14.144.74", 21);
				ftp.login(FtpInfo.FTPID(), FtpInfo.FTPPASSWORD());
				ftp.setFileType(ftp.BINARY_FILE_TYPE);
				ftp.enterLocalPassiveMode();
				
				// 연결이 실패할 경우
				if (!FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
					ftp.disconnect();
				}
				
				ftp.changeWorkingDirectory("/public_html/shop/clothes/");

				// 업로드 시도, 결과 boolean으로 리턴가능
				ftp.storeFile(uuidFileName, fis);
				
				returnStr = "http://heonydesign.000webhostapp.com/shop/clothes/" + uuidFileName;
			} catch (Exception e) {
				returnStr = "fail";
				e.printStackTrace();
			} finally {
				if (fis != null) {
					try {
						fis.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			returnStr = "fail";
			e.printStackTrace();
		}
		
		return returnStr;
	}
}
