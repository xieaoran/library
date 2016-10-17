package com.xieaoran.library.Actions;

import com.opensymphony.xwork2.ActionSupport;
import com.xieaoran.library.Entities.Author;
import com.xieaoran.library.Factories.SqlHelper;
import org.hibernate.Session;

/**
 * Created by xieaoran on 2016/10/8.
 */
public class AuthorManageAction extends ActionSupport {
    private Long id;

    private String name;
    private Integer age;
    private String country;

    private Author resultAuthor;

    private Integer pageType;
    private String message;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Author getResultAuthor() {
        return resultAuthor;
    }

    public void setResultAuthor(Author resultAuthor) {
        this.resultAuthor = resultAuthor;
    }

    public Integer getPageType() {
        return pageType;
    }

    public void setPageType(Integer pageType) {
        this.pageType = pageType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @SuppressWarnings("unchecked")
    public String edit() throws Exception {
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Author sqlAuthor = (Author) session.createQuery("select author " +
                    "from Author author " +
                    "where author.id = :id")
                    .setParameter("id", getId())
                    .getSingleResult();
            sqlAuthor.setName(getName());
            sqlAuthor.setAge(getAge());
            sqlAuthor.setCountry(getCountry());
            session.getTransaction().commit();
            session.close();
            setResultAuthor(sqlAuthor);
            setPageType(2);
            setMessage("作者编辑成功。");
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public String execute() throws Exception {
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            if (null != getId()) {
                Author sqlAuthor = (Author) session.createQuery("select author " +
                        "from Author author " +
                        "where author.id = :id")
                        .setParameter("id", getId())
                        .getSingleResult();
                setResultAuthor(sqlAuthor);
            }
            session.close();
            setPageType(0);
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }

    @SuppressWarnings("unchecked")
    public String create() throws Exception {
        Session session = SqlHelper.getSessionFactory().openSession();
        try {
            Author sqlAuthor = new Author();
            sqlAuthor.setName(getName());
            sqlAuthor.setAge(getAge());
            sqlAuthor.setCountry(getCountry());
            session.beginTransaction();
            session.save(sqlAuthor);
            session.getTransaction().commit();
            session.close();
            setResultAuthor(sqlAuthor);
            setPageType(2);
            setMessage("作者新建成功。");
            return SUCCESS;
        } catch (Exception e) {
            session.close();
            throw e;
        }
    }
}
