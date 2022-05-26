class TransactionsController < ApplicationController
  load_and_authorize_resource :category

  def new; end

  def create; end

  def destroy
    @transaction = @category.expenses.find_by_id(params[:id])
    authorize! :destroy, @transaction
    @transaction.destroy
    redirect_to category_path(@category.id), notice: 'Transaction deleted'
  end
end
