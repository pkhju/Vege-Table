package com.spring.vegan.common.filedownload;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String RESTO_IMAGE_REPO = "C:\\Vegan_Image\\Resto_Image";
	private static final String REVIEW_IMAGE_REPO = "C:\\Vegan_Image\\Review_Image";
	private static final String VEGI_UPLOAD = "C:\\Vegan_Image\\Vegi_Image";
	private static final String INQUERY_UPLOAD = "C:\\Vegan_Image\\Inquery_Image";
	private static final String EVENT_UPLOAD = "C:\\Vegan_Image\\Event_Image";

	@RequestMapping("/downloadRestoImage.do")
	public void downloadRestoImage(@RequestParam("imageFileName") String imageFileName,
			@RequestParam("resto_no") String resto_no,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = RESTO_IMAGE_REPO + "\\" + resto_no + "\\" + imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}


	@RequestMapping("/downloadReviewImage.do")
	public void downloadReviewImage(@RequestParam("imageFileName") String imageFileName,
			@RequestParam("resto_no") String resto_no,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = REVIEW_IMAGE_REPO + "\\" + resto_no + "\\" + imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download.do")
	public void download(@RequestParam("c_image") String c_image, @RequestParam("c_articleNo") int c_articleNo, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = VEGI_UPLOAD + "\\" + c_articleNo + "\\" + c_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+c_image);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download2.do")
	public void download2(@RequestParam("iq_image") String iq_image, @RequestParam("iq_no") int iq_no, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = INQUERY_UPLOAD + "\\" + iq_no + "\\" + iq_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+iq_image);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download3.do")
	public void download3(@RequestParam("e_image") String e_image, @RequestParam("e_no") int e_no, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = EVENT_UPLOAD + "\\" + e_no + "\\" + e_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+e_image);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
