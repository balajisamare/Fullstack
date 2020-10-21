package com;

import java.io.File;
import com.ServerPaths;

import org.apache.commons.fileupload.FileItem;



public class ImageUpload {
	
	
	
	public static String uploadImage(FileItem fi) {
		
		System.out.println("::::: file name " + fi.getName());
		String imgname=fi.getName();
		try {
			File f = new File(ServerPaths.IMAGE_DIR	+ imgname+ ".png");

			fi.write(f);
			System.out.println("File Uploaded Successfully!");
			return "File Uploaded Successfully! File Indexing Completed!";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
