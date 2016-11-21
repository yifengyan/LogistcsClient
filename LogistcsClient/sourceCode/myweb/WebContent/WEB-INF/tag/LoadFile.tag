<%@ tag import="java.io.*"%>

<%response.setHeader("Content-dispositon","attachment;filename='Table.doc'");
	try{
		File f=new File("/home/zzy/workspace/Table.doc");
		FileInputStream in=new FileInputStream(f);
		OutputStream o=response.getOutputStream();
		int n=0;
		byte b[]=new byte[500];
		while((n=in.read(b))!=-1)
			o.write(b,0,n);
		o.close();
		in.close();
		
	}
	catch(Exception exp){
		
	}

%>
