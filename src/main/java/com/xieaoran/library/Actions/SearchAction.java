package com.xieaoran.library.Actions;

import com.opensymphony.xwork2.ActionSupport;
import com.xieaoran.library.Entities.Book;
import com.xieaoran.library.Factories.SqlHelper;
import com.xieaoran.library.Utils.StringPreprocessor;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

public class SearchAction extends ActionSupport {
    private String keyword;
    private List<Book> resultBooks;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public List<Book> getResultBooks() {
        return resultBooks;
    }

    public void setResultBooks(List<Book> resultBooks) {
        this.resultBooks = resultBooks;
    }

    @Override
    @SuppressWarnings("unchecked")
    public String execute() throws Exception {
        if (keyword == null) {
            setResultBooks(new ArrayList<Book>());
            return SUCCESS;
        } else {
            Session session = SqlHelper.getSessionFactory().openSession();
            try{
                session.beginTransaction();
                List<Book> sqlBooks = session.createQuery("select book " +
                        "from Book book " +
                        "where book.author.name like :keyword")
                        .setParameter("keyword", StringPreprocessor.Fuzzy(getKeyword()))
                        .getResultList();
                session.close();
                setResultBooks(sqlBooks);
                return SUCCESS;
            }
            catch (Exception e){
                session.close();
                throw e;
            }
        }
    }
}
