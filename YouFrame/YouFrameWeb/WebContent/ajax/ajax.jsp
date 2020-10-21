
<%@page import="com.ServerPaths"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.ImageUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Writer"%>
<%@page import="java.awt.image.BufferedImageFilter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ServeltHepler"%>


<%
	String sMethod = String.valueOf(request.getParameter("methodId"));
	String returnString = "";
	System.out.println("HIIIII");
	boolean bypasswrite = false;

	HashMap parameters = ServeltHepler.displayRequest(request);

	if (sMethod.equalsIgnoreCase("uploadImage")) {
		HashMap uploadMap = ServeltHepler
				.parseMultipartRequest(request);
		uploadMap.putAll(parameters);

		FileItem fimg = (FileItem) uploadMap.get("fileITEM");
		System.out.println(uploadMap);
		String message = ImageUpload.uploadImage(fimg);
		request.getRequestDispatcher("../page/index.jsp").forward(
				request, response);

	} else if (sMethod.equalsIgnoreCase("getImage")) {
		String imgname = String.valueOf(parameters.get("imgname"));
		String id = String.valueOf(parameters.get("imgid"));
		File folder = new File(ServerPaths.IMAGE_DIR);
		List<File> files = Arrays.asList(folder.listFiles());

		String filePath = files.get(Integer.parseInt(id)).toString();
		File f = new File(filePath);
		System.out.println(f.getAbsolutePath());
		BufferedImage bi = ImageIO.read(f);
		ImageIO.write(bi, "png", response.getOutputStream());
		return;

	}
%>