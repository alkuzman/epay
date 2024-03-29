package dbObjects;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Paycheck extends Entity {
	private long idPaycheck;
	private long accountFrom;
	private long accountTo;
	private double amount;
	private String description;
	private String receiverName;
	private boolean isPaid;

	public Paycheck(long idPaycheck, long accountFrom, long accountTo,
			double amount, String description, String receiverName) {
		super();
		this.idPaycheck = idPaycheck;
		this.accountFrom = accountFrom;
		this.accountTo = accountTo;
		this.amount = amount;
		this.description = description;
		this.receiverName = receiverName;
		this.isPaid = false;
	}
	
	

	public Paycheck(long idPaycheck, long accountFrom, long accountTo,
			double amount, String description, String receiverName,
			boolean isPaid) {
		super();
		this.idPaycheck = idPaycheck;
		this.accountFrom = accountFrom;
		this.accountTo = accountTo;
		this.amount = amount;
		this.description = description;
		this.receiverName = receiverName;
		this.isPaid = isPaid;
	}



	public Paycheck(long idPaycheck) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException,
			IOException {
		super();
		this.idPaycheck = idPaycheck;
		setPaycheckById(idPaycheck);
	}

	private void setPaycheckById(long idPaycheck) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException, IOException {
		Connection conn = getConnection();
		String sql = "{call getPaycheckById(?)}";
		CallableStatement st = conn.prepareCall(sql);
		st.setLong("id", idPaycheck);
		st.execute();
		ResultSet resultSet = st.getResultSet();
		
		while (resultSet.next()) {
			accountFrom = resultSet.getLong("accountFrom");
			accountTo = resultSet.getLong("accountTo");
			amount = resultSet.getDouble("amount");
			description = resultSet.getString("description");
			receiverName = resultSet.getString("receiverName");
			isPaid = resultSet.getBoolean("isPaid");
		}
		conn.close();
	}
	
	@Override
	public String toString() {
		return idPaycheck + "\t" + accountFrom + "\t" + accountTo + "\t" + amount + 
				"\t" + description + "\t" + receiverName + "\t" + isPaid;
	}

	public long getIdPaycheck() {
		return idPaycheck;
	}

	public void setIdPaycheck(long idPaycheck) {
		this.idPaycheck = idPaycheck;
	}

	public long getAccountFrom() {
		return accountFrom;
	}

	public void setAccountFrom(long accountFrom) {
		this.accountFrom = accountFrom;
	}

	public long getAccountTo() {
		return accountTo;
	}

	public void setAccountTo(long accountTo) {
		this.accountTo = accountTo;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public boolean isPaid() {
		return isPaid;
	}

	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Paycheck p = new Paycheck(10);
		System.out.println(p);
	}
	
}
