class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @test = current_user.book_comments.new
    @book_comment.book_id = @book.id
    @book_comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id]).destroy
    @book_comment= BookComment.new
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end