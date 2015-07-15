class BlogMailer < ActionMailer::Base

  def send_blog_to_emails(blog_id)
    blog = Blog.find(blog_id)
    mail(
      to: blog.emails,
      from: blog.author,
      reply_to: 'anyone@tinkerbox.com.sg',
      subject: blog.title,
      body: blog.content,
      content_type: 'text/html'
    )
  end

end
