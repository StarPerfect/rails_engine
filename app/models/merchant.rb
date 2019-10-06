class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  validates_presence_of :name

  def self.top_by_revenue(quantity)
    # joins(items: [invoices: [:transactions]])
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where(transactions: {result: :success})
    .group(:id).order('revenue DESC')
    .limit(quantity)
  end

  def self.revenue_by_date(date)
    joins(invoices: [:invoice_items, :transactions])
    .select("SUM(invoice_items.unit_price * invoice_items.quantity), date(invoices.created_at)")
    .group("date(invoices.created_at)")
    .where(transactions: {result: :success})
    .where(invoices: {created_at: date})
  end
end

# select SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue, date(invoices.created_at)
# FROM invoice_items
# INNER JOIN transactions ON invoice_items.invoice_id = transactions.invoice_id
# INNER JOIN invoices ON transactions.invoice_id = invoices.id
# WHERE transactions.result = 'success' AND date(invoices.created_at) = '2012-03-15'
# GROUP BY date(invoices.created_at);
