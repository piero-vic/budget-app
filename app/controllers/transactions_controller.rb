class TransactionsController < ApplicationController
  load_and_authorize_resource :category

  def new
    @transaction = @category.expenses.new(user_id: current_user.id)
    authorize! :manage, @transaction
  end

  def create
    @transaction = @category.expenses.new(transaction_params.merge(user_id: current_user.id))
    authorize! :create, @transaction
    if @transaction.save
      redirect_to category_path(@category.id), notice: 'New transaction added'
    else
      redirect_to new_category_transaction_path(@category.id), alert: 'Something went wrong, try again!!'
    end
  end

  def destroy
    @transaction = @category.expenses.find_by_id(params[:id])
    authorize! :destroy, @transaction
    @transaction.destroy
    redirect_to category_path(@category.id), notice: 'Transaction deleted'
  end

  protected

  def transaction_params
    params.require(:expense).permit(:name, :amount)
  end
end
