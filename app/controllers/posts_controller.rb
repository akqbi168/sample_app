class PostsController < ApplicationController
	def new
		#　空のモデルをビューへ渡す
		@post = Post.new
	end

	def create
		# ストロングパラメーターを使用
		post = Post.new(post_params)
		# DBへ保存する
		post.save
		# トップ画面へリダイレクト
		redirect_to '/top'
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		post = Post.new(post_params)
		post.save # DBへ保存する
		redirect_to post_path(post.id) # 詳細画面へリダイレクト
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
