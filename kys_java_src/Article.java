/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kys_deneme1;

/**
 *
 * @author user
 */
public class Article {
    private String title;
    private String articleText;
    private String authors;
    private String contact;
    private String summary;
    private String keywords;
    private String subject;

    public Article(){
        this("","","","","","","");
    }
    
    public Article(String title, String articleText, String authors, 
            String contact, String summary, String keywords, String subject){
        
        SetTitle(title);
        SetArticleText(articleText);
        SetAuthors(authors);
        SetContact(contact);
        SetSummary(summary);
        SetKeywords(keywords);
        SetSubject(subject);
    }
    
    public void SetTitle(String title){
        this.title=title;
    }
    public void SetArticleText(String articleText){
        this.articleText=articleText;
    }
    public void SetAuthors(String authors){
        this.authors=authors;
    }
    public void SetContact(String contact){
        this.contact=contact;
    }
    public void SetSummary(String summary){
        this.summary=summary;
    }
    public void SetKeywords(String keywords){
        this.keywords=keywords;
    }
    public void SetSubject(String subject){
        this.subject=subject;
    }
    
     public String GetTitle(){
        return title;
    }
    public String GetArticleText(){
        return articleText;
    }
    public String GetAuthors(){
        return authors;
    }
    public String GetContact(){
        return contact;
    }
    public String GetSummary(){
        return summary;
    }
    public String GetKeywords(){
        return keywords;
    }
    public String GetSubject(){
        return subject;
    }
    
}
