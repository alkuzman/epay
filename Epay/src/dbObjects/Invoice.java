package dbObjects;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Invoice extends Entity {
	private long idInvoice;
	private long sender;
	private long receiver;
	
	public Invoice(long idInvoice, long sender, long receiver) {
		super();
		this.idInvoice = idInvoice;
		this.sender = sender;
		this.receiver = receiver;
	}
	
	public Invoice(long idInvoice) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		super();
		this.idInvoice = idInvoice;
		setInvoiceById(idInvoice);
	}
	
	/**
	 * 
	 * @return documents attached to this Invoice
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public List<Document> getDocuments() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = getConnection();
		String sql = "{call getDocumentsForInvoice(?)}";
		CallableStatement st = conn.prepareCall(sql);
		st.setLong("idinvoice", idInvoice);
		st.execute();
		ResultSet resultSet = st.getResultSet();
		
		List<Document> documents = new ArrayList<Document>();
		
		while(resultSet.next()) {
			documents.add(new Document(resultSet.getLong("idDocuments"), resultSet.getLong("invoice"), 
					resultSet.getString("title"), resultSet.getString("description"), resultSet.getString("url"), resultSet.getString("content_type")));
		}
		
		conn.close();
		
		return documents;
	}
	
	private void setInvoiceById(long idInvoice) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		Connection conn = getConnection();
		String sql = "{call getInvoiceById(?)}";
		CallableStatement st = conn.prepareCall(sql);
		st.setLong("id", idInvoice);
		st.execute();
		ResultSet resultSet = st.getResultSet();
		
		while(resultSet.next()) {
			sender = resultSet.getLong("sender");
			receiver = resultSet.getLong("receiver");
		}
		
		conn.close();
	}
	
	
	public List<Paycheck> getPaychecks() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = getConnection();
		String sql = "{call getPaychecksForInvoice(?)}";
		CallableStatement st = conn.prepareCall(sql);
		st.setInt("idinvoice", (int)idInvoice);
		st.execute();
		ResultSet resultSet = st.getResultSet();
		
		List<Paycheck> paychecks = new ArrayList<Paycheck>();
		
		while(resultSet.next()) {
			paychecks.add(new Paycheck(resultSet.getLong("idpaycheck")));
		}
		conn.close();
		return paychecks;
	}

	public long getIdInvoice() {
		return idInvoice;
	}

	public void setIdInvoice(long idInvoice) {
		this.idInvoice = idInvoice;
	}

	public long getSender() {
		return sender;
	}

	public void setSender(long sender) {
		this.sender = sender;
	}

	public long getReceiver() {
		return receiver;
	}

	public void setReceiver(long receiver) {
		this.receiver = receiver;
	}
	
	public double getAmount() {
		double amount = 0;
		try {
			List<Paycheck> paychecks = getPaychecks();
			for(Paycheck paycheck : paychecks)
				amount += paycheck.getAmount();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public boolean isPaid() {
		boolean isPaid = true;
		List<Paycheck> paychecks;
		try {
			paychecks = getPaychecks();
			for (Paycheck paycheck : paychecks) {
				isPaid = paycheck.isPaid() && isPaid;
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block￼
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isPaid;
	}
}