class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
  	@comments = Comment.all
  end

  def create
    comment = Comment.create! params.require(:comment).permit(:content)
    comment.image.attach(params[:comment][:image])
    redirect_to comment    
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def letter_pad
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "letter", 
        disposition: 'inline',
        layout: false,
        margin:  {   top: 0,
                     bottom: 0,
                     left: 0,
                     right: 0 }
         # footer:  { html: { template: 'comments/footer.pdf.erb',layout: false } }
      end
    end
  end


end