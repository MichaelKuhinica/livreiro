class BooksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :collect_page

  def free
    @books = Book.free.page(@page)

    respond_to do |format|
      format.html
      format.xml { render :xml => @books }
    end
  end

  # GET /books
  # GET /books.xml
  def index
    page = params[:page] || 1
    @books = Book.page(@page)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  def lend
    @book = Book.find(params[:id])
    @book.lend current_user
    flash[:notice] = "Voce pegou #{@book.title} emprestado de #{@book.owner}."
    redirect_to :back
  end

  def return 
    @book = Book.find(params[:id])
    @book.return
    flash[:notice] = "Voce devolveu #{@book.title} para #{@book.owner}."
    redirect_to :back
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    deny! unless @book.owner == current_user
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to(books_path, :notice => 'Livro criado.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(books_path, :notice => 'Livro atualizado.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def search 
    parameters = params[:keywords] || ''
    @search = Book.search do
      keywords(parameters) 
      paginate(:page => params[:page], :per_page => 10)
    end
  end
end
