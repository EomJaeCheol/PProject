package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.jdbc.DBConnection;

public class StudentInfoDAO {
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	
	public boolean insert(StudentInfoBeanDTO dto){
		boolean flag=false;
		int res=0;
		int num=0;
		try{
			con = DBConnection.getConnect();
			
			sql = "select max(No) from Studentinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 기존의 글이 있다. => 기존의 가장 마지막 글 번호 + 1
				// num = rs.getInt("max(num)")+1;
				num = rs.getInt(1) + 1;
			}
			
			// sql 작성 & 객체 생성No,department,grade,majorin,StuNumber,name,jumin,gender,phone,email,filename,filesize
			sql = "insert into Studentinfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); //No
			pstmt.setString(2, dto.getDepartment()); //department
			pstmt.setString(3, dto.getGrade()); //grade
			pstmt.setString(4, dto.getMajorin()); //majorin
			//String phone=MemberBean.getPhone1()+"-"+MemberBean.getPhone2()+"-"+MemberBean.getPhone3();
			pstmt.setInt(5, dto.getStuNumber()); //StuNumber
			pstmt.setString(6, dto.getPass()); //pass
			pstmt.setString(7, dto.getName()); //name
			pstmt.setString(8, dto.getJumin()); //jumin
			pstmt.setString(9, dto.getGender()); //gender
			pstmt.setString(10, dto.getPhone()); //phone
			pstmt.setString(11, dto.getEmail()); //email
			pstmt.setString(12, dto.getFilename());
			pstmt.setLong(13, dto.getFilesize());
			pstmt.setString(14, dto.getPost());
			
			//System.out.println("디비에서"+dto.getMajorin());
			
			res=pstmt.executeUpdate();
			if(res==1){flag=true;}
	
		} catch (SQLException e) {
			System.out.println("디비 연결 실패 && SQL 오류");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return flag;
	}
	
/*	public int search(){
		int cnt=0;
		//StringBuffer sql=null;
		try{	
			con = DBConnection.getConnect();
			sql = "select count(*) from Studentinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return cnt;
	}*/
/*	public int StuNumbersearch(int No){
		int number=0;
		//StringBuffer sql=null;
		try{	
			con = DBConnection.getConnect();
			sql = "select StuNumber from Studentinfo where No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, No);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt("StuNumber");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return number;
	}*/
	public int StuNumbersearch(String name){
		int StuNumber=0;
		//StringBuffer sql=null;
		try{	
			con = DBConnection.getConnect();
			sql = "select StuNumber from Studentinfo where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				StuNumber = rs.getInt("StuNumber");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return StuNumber;
	}
	
	/*public StudentInfoBeanDTO read(int No){
		StudentInfoBeanDTO dto=null;
		//StringBuffer sql=null;
		try{
			con = DBConnection.getConnect();
			//sql=new StringBuffer();
			sql="select * from Studentinfo where No=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, No);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new StudentInfoBeanDTO();
				dto.setNo(rs.getInt("No"));
				dto.setName(rs.getString("name"));
				dto.setStuNumber(rs.getString("StuNumber"));
				dto.setFilename(rs.getString("filename"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return dto;
	}
	*/
	public StudentInfoBeanDTO read(int Number){
		StudentInfoBeanDTO dto=null;
		//StringBuffer sql=null;
		try{
			con = DBConnection.getConnect();
			//sql=new StringBuffer();
			sql="select * from Studentinfo where StuNumber=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Number);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new StudentInfoBeanDTO();
				//dto.setNo(rs.getInt("No"));
				dto.setName(rs.getString("name"));
				dto.setGrade(rs.getString("grade"));
				dto.setDepartment(rs.getString("department"));
				dto.setMajorin(rs.getString("majorin"));
				dto.setJumin(rs.getString("jumin"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setStuNumber(rs.getInt("StuNumber"));
				dto.setEmail(rs.getString("email"));
				dto.setPost(rs.getString("post"));
				dto.setFilename(rs.getString("filename"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return dto;
	}
	
	public ArrayList<StudentInfoBeanDTO> list(){
		
		ArrayList<StudentInfoBeanDTO> list=null;
		
		try{
			sql="select * from Studentinfo";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<StudentInfoBeanDTO>();
				StudentInfoBeanDTO dto=null;
				while(rs.next()){
					dto=new StudentInfoBeanDTO();
					//dto.setDepartment(rs.getString("department"));
					//dto.setGrade(rs.getString("grade"));
					//dto.setMajorin(rs.getString("majorin"));
					dto.setStuNumber(rs.getInt("StuNumber"));
					dto.setPass(rs.getString("pass"));
					dto.setName(rs.getString("name"));
					//dto.setJumin(rs.getString("jumin"));
					//dto.setGender(rs.getString("gender"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setFilename(rs.getNString("filename"));
					list.add(dto);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			// 자원 해제
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (con != null) {con.close();con = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//로그인
	public int idCheck(int Stuid, String Stupass) throws Exception{
		int check=-1;  //check=-1;
		
		try {
			con = DBConnection.getConnect();
			sql="select pass from Studentinfo where StuNumber=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Stuid);
			//쿼리 실행
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				//아이디가 존재할때
				if(Stupass.equals(rs.getString("pass"))){
					//비밀번호 같다
					check=1;
				}else{
					check=0;
				}
			}else{
				//아이디가 없을때
				check=-1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		
		return check;
	}
	
	public boolean idDupCheck(String user_number) throws Exception{
		boolean check=false;
		
		try {
			con = DBConnection.getConnect();
			sql="select * from Studentinfo where StuNumber=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user_number);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				check = false;
			} else {
				//사용가능!
				check = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return check;
	}
	
	public int updateStu(StudentInfoBeanDTO MemberBean,String Newpass) throws Exception {
		
		int check = -1;
		try {
			con = DBConnection.getConnect();
			sql = "select pass from Studentinfo where StuNumber=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, MemberBean.getStuNumber());
			rs = pstmt.executeQuery();

			// 아이디 & 비밀번호 = > 수정 1 리턴
			if (rs.next()) {
				if(MemberBean.getPass().equals(rs.getString("pass"))){
				//if (MemberBean.getPass().equals(rs.getString("pass"))) {
					//sql = "update Studentinfo set pass=?,email=?,phone=? where id=?";
					sql="update Studentinfo set pass=?,email=?,post=? where StuNumber=?";
					pstmt = con.prepareStatement(sql);
					//pstmt.setString(1, MemberBean.getId());
					pstmt.setString(1, Newpass);
					pstmt.setString(2, MemberBean.getEmail());
					pstmt.setString(3, MemberBean.getPost());
					pstmt.setInt(4, MemberBean.getStuNumber());
					pstmt.executeUpdate();
					System.out.println("회원정보 수정완료");
					check = 1;
				} else {
					// 아이디, 비밀번호 x=> 0리턴
					check = 0;
				}
			} else {
				check = -1;
				// 아이디 x =>-1리턴
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return check;
	}
}
