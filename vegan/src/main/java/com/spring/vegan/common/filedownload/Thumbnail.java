package com.spring.vegan.common.filedownload;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class Thumbnail {
	private static String CURR_IMAGE_REPO_PATH = "C:\\Users\\UserF\\Desktop\\YSH\\file_repo";
	
	@RequestMapping("/thumbnail")
	public void download(@RequestParam("imageFileName") String imageFileName,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		
		File image = new File(filePath);

		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0, lastIndex);
		
		System.out.println(fileName);
		File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "thumbnail" + "\\" + fileName + ".png");

		if(image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumbnail);
		}
		
		if(image.exists()) {
			Thumbnails.of(image).size(50, 50).outputFormat("png").toOutputStream(out);
		}
		
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		
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
}