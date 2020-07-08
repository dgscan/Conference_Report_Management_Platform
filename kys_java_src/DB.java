/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kys_deneme1;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author user
 */
public class DB {
    
    private Connection con;
    PreparedStatement pstm=null;
    ResultSet rs=null;
    Statement stm = null;
    private int auth;
    private String nameChk;
    private String articleID;
    private String articleAuthors;
    private String articleSummary;
    private String articleSubject;
    private String articleReviewer;
    private String articleUserID;
    private String articleTitle;
    private String article;
    private String keywords;
    private String rev1Score, rev2Score, rev3Score;
    private String rev1ID, rev2ID, rev3ID;
    private ArrayList <String> scores;
    private ArrayList <String> IDs;
    private ArrayList <String> articleIDReviewer;
    private ArrayList <String> arTitle;
    ArrayList <String> arIDs;
    
    private ArrayList <String> selectedArticleID = new ArrayList <String>();
    
    //open DB
    public void OpenConnection(){
        try{
            this.con = DriverManager.getConnection("jdbc:mysql://localhost/kys_db?useSSL=false&serverTimezone=UTC","root","");
            System.out.println("Connection with database established correctly.");
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
    }
    
    //write USER TO DB
    public boolean RecordUserToDB(String email, String name, String surname, String password, 
            String type, String university, String subject){
            Statement stm = null;
        try{
            stm = con.createStatement();
            String sql = "Insert into user values ('"+email+"','"+name+"','"+surname+"',"
                    + "'"+password+"','"+type+"','"+university+"','"+subject+"')";
            stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Records are registered!");
            return true;
            
        }catch(SQLException | HeadlessException e){
            System.out.println("Error : "+e.getMessage());
            JOptionPane.showMessageDialog(null, "Error : "+e.getMessage());
            return false;
        }
        
    }
    
    //close DB
    public void CloseDB(){
        if (con != null)
            try {
                con.close();
        } catch (SQLException ex) {
            System.out.println("Error : "+ex.getMessage());
        }
    }
    
    //set auth 1: user login 0: wrong e-mail or password
    public void SetAuth(int auth){
        this.auth=auth;
    }
    public int GetAuth(){
        return auth;
    }
    
    //Authenticate USER DB
    public void AuthenticationUser(String email, String password){
        
        String sql = "Select * from user ";//where email='"+email+"'and password=md5('"+password+"')";
        
        String userEmail=null;
        String userPass=null;
        String userName=null;
        
        boolean flag = true;
        
        try{
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            while(rs.next() && flag){
                userEmail=rs.getString("email");
                userPass=rs.getString("password");
                userName=rs.getString("name");
                
                System.out.println("1: "+userEmail);
                System.out.println("2: "+userPass);
                
                //if user exists
                if (email.equals(userEmail)&& password.equals(userPass)){
                    
                    JOptionPane.showMessageDialog(null,"Welcome "+userName);
                    
                    SetAuth(1);
                    flag=false;
                }else{ //there is no such user
                    flag=true;
                    SetAuth(0);
                }
            }
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Error : "+ e.getMessage());
        }
        //return(false);
    }
    
    //Record article into DB
    public boolean RecordArticle(String userID, String title, String article, String authors, 
            String contact, String summary, String keywords, String subject){
        
        Statement stm = null;
        
        try{            
            System.out.println(userID);
            stm=con.createStatement();
            String sql = "Insert into articletable(email,title,article,authors,contact,summary,keywords,subject) values ('"
                    +userID+"','"+title+"','"+article+"','"+authors+"','"+contact+"','"+summary+"','"+keywords+"','"+subject+"')";
            stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Artcile Sent!");
            return true;
        }catch(SQLException | HeadlessException e){
            System.out.println("Error : "+e.getMessage());
            JOptionPane.showMessageDialog(null, "Error : "+e.getMessage());
            return false;
        }
    }
    
    //check user type and return its value
    public String CheckUserType (String userID){
        
        String email=null;
        String type=null;
        String name=null;
        
        String sql = "Select * from user ";
        boolean flag = true;
        
        
        try{
           stm=con.createStatement();
           rs=stm.executeQuery(sql);
           
           while(rs.next() && flag){
               email=rs.getString("email");
               name=rs.getString("name");
               type=rs.getString("type");
               
               System.out.println("check: "+email);
               
               if (email.equals(userID)){
                   flag=false;//found email
                   SetNameUserTypeCheck(name);
                   return type;
               }else{
                   //there is no such email
                   flag=true;
               }
           }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Error : "+ e.getMessage());
        }
        
        return "";
    }
    
    public void SetNameUserTypeCheck(String name){
        nameChk=name;
    }
    
    public String GetNameUserTypeCheck(){
        return nameChk;
    }
    
    //take articles from article table(COMBOBOX) and print to okb
    public void ArticleList(JComboBox articleTitles){
        String sql ="select * from articletable";
        try{
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                
                articleTitles.addItem(rs.getString("title"));
                articleID=(rs.getString("articleID"));                
            }   
        }
        catch(Exception ex){
            System.out.println("Error : "+ex.getMessage());
        }
        
    }
    
    //RETURN ARTICLE ID OF SELECTED COMBOBOX
    public String GetArticleID(String title){
        String sql="select * from articletable";
        
        try{
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                
                if(title.equals(rs.getString("title"))){
                    
                        return rs.getString("articleID");

                }
            }
            
        }catch(Exception ex){
           System.out.println("Error : "+ex.getMessage()); 
        }
        
        return null;
    }
    
    //FULFILL ARTICLE INFORMATIONS(AUTHORS, SUMMARY AND SUBJECT)
    public void FulfillArticleInfo(String articleID){
        
        String sql = "select * from articletable";
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                String id = rs.getString("articleID");
                if(articleID.equals(id)){
                    SetArticleAuthors(rs.getString("authors"));
                    SetArticleSummary(rs.getString("summary"));
                    SetArticleSubject(rs.getString("subject"));
                    SetArticleUserID(rs.getString("email"));
                    
                    SetArticleTitle(rs.getString("title"));
                    SetArticle(rs.getString("article"));
                    SetKeywords(rs.getString("keywords"));
                }
            }
        } catch (SQLException ex) {
           System.out.println("Error : "+ex.getMessage()); 
        }
        
    }
    
    public void SetArticle(String article){
        this.article=article;        
    }
    public String GetArticle(){
        return article;
    }
    
    public void SetKeywords(String keywords){
        this.keywords=keywords;
    }
    public String GetKeywords(){
        return keywords;
    }
    
    public void SetArticleTitle(String articleTitle){
        this.articleTitle=articleTitle;
    }
    
    public String GetArticleTitle(){
        return articleTitle;
    }
    
    public void SetArticleUserID(String articleUserID){
        this.articleUserID=articleUserID;
    }
    
    public String GetArticleUserID(){
        return articleUserID;
    }
    
    public void SetArticleAuthors(String authors){
        articleAuthors=authors;
    }
    
    public String GetArticleAuthors(){
        return articleAuthors;
    }
    
    public void SetArticleSummary(String summary){
        articleSummary=summary;
    }
    public String GetArticleSummary(){
        return articleSummary;
    }
    
    public void SetArticleSubject(String subject){
        articleSubject=subject;
    }
    public String GetArticleSubject(){
        return articleSubject;
    }
    
    public void FulfillAuthors(String subject, String userID, DefaultListModel<String> listModel,
             ArrayList<String> reviewerID){
        String sql="select * from user";
        
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                if(subject.equals(rs.getString("reviewSubject")) && rs.getString("type").equals("Hakem") &&
                        !userID.equals(rs.getString("email"))){
                    
                    SetArticleReviewer(rs.getString("name")+" "+rs.getString("surname"));//set reviewer name surname
                    SetReviewerID(rs.getString("email")); //set reviewer ID
                    listModel.addElement(GetArticleReviewer());
                    reviewerID.add(GetReviewerID());
                }
            }
            
        } catch (SQLException ex) {
            System.out.println("Error : "+ex.getMessage());
            JOptionPane.showMessageDialog(null,"Error retreieving reviewers from database: "+ ex.getMessage());
        }
    }
    
    public void SetArticleReviewer(String articleReviewer){
        this.articleReviewer=articleReviewer;
    }
    public String GetArticleReviewer(){
        return articleReviewer;
    }
    
    public void SetReviewerID(String articleUserID){
        this.articleUserID=articleUserID;
    }
    public String GetReviewerID(){
        return articleUserID;
    }
    
    //INSERT SELECTED REVIWERS AND RELATED ARTICLES INTO DB
    public void InsertReviewersAndArticleDB(String articleID, String reviewer1, String reviewer2, 
            String reviewer3){
        
        stm=null;
        
        try {
            stm=con.createStatement();
            
            String sql="insert into article_reviewer (articleID,reviewer1ID,reviewer2ID, reviewer3ID) values('"+
                articleID+"','"+reviewer1+"','"+reviewer2+"','"+reviewer3+"')";
            
            stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Artcile Assignment Sent!");

        } catch (SQLException ex) {
            System.out.println("Error : "+ex.getMessage());
            JOptionPane.showMessageDialog(null, "DB Insertion error to assign articles: "+ex.getMessage());
        }
        
        System.out.println(articleID);
        System.out.println(reviewer1);
        System.out.println(reviewer2);
        System.out.println(reviewer3);
    }    
    
    //SELECT IF ARTICLED ASSIGNED BEFORE RETURN TRUE
    public boolean ArticleAssignedBefore(String articleID){

        String sql="select * from article_reviewer";
        boolean r = true;
        stm=null;
        
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                if(articleID.equals(rs.getString("articleID"))){
                    System.out.println(articleID);
                    r=true;
                }
                r=false;
            }
        } catch (SQLException ex) {
            System.out.println("Error : "+ex.getMessage());
            JOptionPane.showMessageDialog(null, "Error : "+ex.getMessage());
            return false;
        }
        return r;
    }
    
    //HAKEM ID'SİNE GÖRE EŞLEŞEN LİSTMODELLERİ SET ET VE ARTICLE ID'LERİ SET ET
    public void ArticlesToBeScored(String reviewerID, DefaultListModel<String> listModel) throws SQLException{
        
        String sql="SELECT * FROM article_reviewer LEFT OUTER JOIN articletable on article_reviewer.articleID=articletable.articleID";
        
        stm=con.createStatement();
        rs=stm.executeQuery(sql);
        
        while(rs.next()){
            String rev1 = rs.getString("article_reviewer.reviewer1ID");
            String rev2 = rs.getString("article_reviewer.reviewer2ID");
            String rev3 = rs.getString("article_reviewer.reviewer3ID");
            
            if(reviewerID.equals(rev1) || reviewerID.equals(rev2) || reviewerID.equals(rev3)){
                System.out.println(rs.getString("articletable.title"));//test printout
                listModel.addElement(rs.getString("articletable.title"));
                SetSelectedArticleID(rs.getString("articletable.articleID"));

            }
            
        }
        
    }
    
    public void GetTitleOfArticles(JComboBox titles){
        
        String sql="SELECT * FROM articletable AS ar RIGHT OUTER JOIN score AS sc ON ar.articleID=sc.articleID";
        
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                
                titles.addItem(rs.getString("ar.title"));
               /* scores.add(rs.getString("sc.score"));
                IDs.add(rs.getString("sc.reviewerID"));*/
                

            }
           // SetScores(scores);
           //SetReviewerIDs(IDs);
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    } // KULLANILMA DURUMUNU KONTROL ET*/
    
   public ArrayList<String> GetScores(){
       return scores;
   }
   
   public void SetReviewerIDs(ArrayList <String> IDs){
       this.IDs=IDs;
   }
   public ArrayList<String> GetReviewerIDs(){
       return IDs;
   }
    
    
    public void SetSelectedArticleID(String ID){
        selectedArticleID.add(ID);
    }
    
    public ArrayList<String> GetSelectedArticleID(){
        return selectedArticleID;
    }
    
    
    public void SendScore(String articleID, String reviewerID, int score){
        
        stm=null;
        
        try {
            stm=con.createStatement();
            String sql="insert into score values ('"+articleID+"','"+reviewerID+"','"+score+"')";
            stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Score Sent!");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error : "+ex.getMessage());
        }
        
        System.out.println(articleID+" "+reviewerID+" "+score);
        
    }
    
    public boolean SendScoreBefore(String articleID, String reviewerID) throws SQLException{
        
        boolean r = false;
        String sql="select * from score";
        
        stm=con.createStatement();
        rs=stm.executeQuery(sql);
        
        while(rs.next()){
            
            if(articleID.equals(rs.getString("reviewerID")) && reviewerID.equals(rs.getString("articleID"))){
                r=true;
                System.out.println("article var");
            }else{
                r = false;
                System.out.println("article yok");
            }            
        }
        return r;
    }
    
    //OKB ONAY ARTICLE İÇİN ID SEÇ
    public void GetArticleIDReviewer(){
        articleIDReviewer = new ArrayList<String>();

        String sql ="select * from article_reviewer";
        
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                articleIDReviewer.add(rs.getString("articleID"));
            }
            SetArticleTitleFromID(articleIDReviewer);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Error :"+ ex.getMessage());
        }   
    }
    
    
    //puanlama için gönderilen title idlerini variable içine ata
    public void SetArticleTitleFromID(ArrayList<String> articleIDReviewer){
        this.articleIDReviewer=articleIDReviewer;
    }
    
    //puanlama için gönderilen title idlerinin isimlerini DB'den çek
    public ArrayList<String> GetArticleTitleFromID(ArrayList<String> arID){
        arTitle = new ArrayList <String>();
        String sql="Select * from articletable";
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                
                for (int i = 0; i<articleIDReviewer.size(); i++){
                    if(articleIDReviewer.get(i).equals(rs.getString("articleID"))){
                        arTitle.add(rs.getString("title"));
                        arID.add(rs.getString("articleID"));
                    }
                }
                
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Error :"+ ex.getMessage());
        }
        
        
        return arTitle;
    }
    
    public ArrayList<String> ReviewerScores(String articleID){
        
        String sql = "select * from score";
        ArrayList <String> scrs = new ArrayList<String>();
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                
                if(articleID.equals(rs.getString("articleID"))){
                    scrs.add(rs.getString("score"));
                }
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Error :"+ ex.getMessage());
        }
        return scrs;
    }
    
    
    public void RecordOKBDecision(String articleID, String decision, int avgScore){
        
      try{
      // create the java mysql update preparedstatement
      String sql = "Update articletable set avgScore = ?, decision = ? where articleID = ?";
      PreparedStatement preparedStmt = con.prepareStatement(sql);
      preparedStmt.setInt(1, avgScore);
      preparedStmt.setString(2, decision);
      preparedStmt.setString(3, articleID);
      
      JOptionPane.showMessageDialog(null, "Submitted!");

      // execute the java preparedstatement
      preparedStmt.executeUpdate();
      }catch(Exception ex){
          JOptionPane.showMessageDialog(null, ex.getMessage());
      }
        
    }
    
    public ArrayList<String> FulFillUserEntries(String userID){
        
        String sql="Select * from articletable";
        arIDs = new ArrayList<String>();
        try {
            stm=con.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                if(userID.equals(rs.getString("email")))
                
                arIDs.add(rs.getString("title"));
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error : "+ex.getMessage());
        }
        return arIDs;
    }

}
