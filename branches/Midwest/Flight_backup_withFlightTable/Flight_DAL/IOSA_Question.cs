
/*
'===============================================================================
'  Generated From - CSharp_dOOdads_BusinessEntity.vbgen
' 
'  ** IMPORTANT  ** 
'  How to Generate your stored procedures:
' 
'  SQL        = SQL_StoredProcs.vbgen
'  ACCESS     = Access_StoredProcs.vbgen
'  ORACLE     = Oracle_StoredProcs.vbgen
'  FIREBIRD   = FirebirdStoredProcs.vbgen
'  POSTGRESQL = PostgreSQL_StoredProcs.vbgen
'
'  The supporting base class SqlClientEntity is in the Architecture directory in "dOOdads".
'  
'  This object is 'abstract' which means you need to inherit from it to be able
'  to instantiate it.  This is very easilly done. You can override properties and
'  methods in your derived class, this allows you to regenerate this class at any
'  time and not worry about overwriting custom code. 
'
'  NEVER EDIT THIS FILE.
'
'  public class YourObject :  _YourObject
'  {
'
'  }
'
'===============================================================================
*/

// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace Flight_DAL
{
	public abstract class _IOSA_Question : SqlClientEntity
	{
		public _IOSA_Question()
		{
			this.QuerySource = "IOSA_Question";
			this.MappingName = "IOSA_Question";

		}	

		//=================================================================
		//  public Overrides void AddNew()
		//=================================================================
		//
		//=================================================================
		public override void AddNew()
		{
			base.AddNew();
			
		}
		
		
		public override void FlushData()
		{
			this._whereClause = null;
			this._aggregateClause = null;
			base.FlushData();
		}
		
		//=================================================================
		//  	public Function LoadAll() As Boolean
		//=================================================================
		//  Loads all of the records in the database, and sets the currentRow to the first row
		//=================================================================
		public bool LoadAll() 
		{
			ListDictionary parameters = null;
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_IOSA_QuestionLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int QuestionID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.QuestionID, QuestionID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_IOSA_QuestionLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter QuestionID
			{
				get
				{
					return new SqlParameter("@QuestionID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter DepartementID
			{
				get
				{
					return new SqlParameter("@DepartementID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter SectionID
			{
				get
				{
					return new SqlParameter("@SectionID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter VersionID
			{
				get
				{
					return new SqlParameter("@VersionID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter AnswerID
			{
				get
				{
					return new SqlParameter("@AnswerID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter QuestionText
			{
				get
				{
					return new SqlParameter("@QuestionText", SqlDbType.NVarChar, 2000);
				}
			}
			
			public static SqlParameter Description
			{
				get
				{
					return new SqlParameter("@Description", SqlDbType.NVarChar, 1073741823);
				}
			}
			
			public static SqlParameter Number
			{
				get
				{
					return new SqlParameter("@Number", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter AuditorComment
			{
				get
				{
					return new SqlParameter("@AuditorComment", SqlDbType.NVarChar, 1000);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string QuestionID = "QuestionID";
            public const string DepartementID = "DepartementID";
            public const string SectionID = "SectionID";
            public const string VersionID = "VersionID";
            public const string AnswerID = "AnswerID";
            public const string QuestionText = "QuestionText";
            public const string Description = "Description";
            public const string Number = "Number";
            public const string AuditorComment = "AuditorComment";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[QuestionID] = _IOSA_Question.PropertyNames.QuestionID;
					ht[DepartementID] = _IOSA_Question.PropertyNames.DepartementID;
					ht[SectionID] = _IOSA_Question.PropertyNames.SectionID;
					ht[VersionID] = _IOSA_Question.PropertyNames.VersionID;
					ht[AnswerID] = _IOSA_Question.PropertyNames.AnswerID;
					ht[QuestionText] = _IOSA_Question.PropertyNames.QuestionText;
					ht[Description] = _IOSA_Question.PropertyNames.Description;
					ht[Number] = _IOSA_Question.PropertyNames.Number;
					ht[AuditorComment] = _IOSA_Question.PropertyNames.AuditorComment;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string QuestionID = "QuestionID";
            public const string DepartementID = "DepartementID";
            public const string SectionID = "SectionID";
            public const string VersionID = "VersionID";
            public const string AnswerID = "AnswerID";
            public const string QuestionText = "QuestionText";
            public const string Description = "Description";
            public const string Number = "Number";
            public const string AuditorComment = "AuditorComment";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[QuestionID] = _IOSA_Question.ColumnNames.QuestionID;
					ht[DepartementID] = _IOSA_Question.ColumnNames.DepartementID;
					ht[SectionID] = _IOSA_Question.ColumnNames.SectionID;
					ht[VersionID] = _IOSA_Question.ColumnNames.VersionID;
					ht[AnswerID] = _IOSA_Question.ColumnNames.AnswerID;
					ht[QuestionText] = _IOSA_Question.ColumnNames.QuestionText;
					ht[Description] = _IOSA_Question.ColumnNames.Description;
					ht[Number] = _IOSA_Question.ColumnNames.Number;
					ht[AuditorComment] = _IOSA_Question.ColumnNames.AuditorComment;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string QuestionID = "s_QuestionID";
            public const string DepartementID = "s_DepartementID";
            public const string SectionID = "s_SectionID";
            public const string VersionID = "s_VersionID";
            public const string AnswerID = "s_AnswerID";
            public const string QuestionText = "s_QuestionText";
            public const string Description = "s_Description";
            public const string Number = "s_Number";
            public const string AuditorComment = "s_AuditorComment";

		}
		#endregion		
		
		#region Properties
	
		public virtual int QuestionID
	    {
			get
	        {
				return base.Getint(ColumnNames.QuestionID);
			}
			set
	        {
				base.Setint(ColumnNames.QuestionID, value);
			}
		}

		public virtual int DepartementID
	    {
			get
	        {
				return base.Getint(ColumnNames.DepartementID);
			}
			set
	        {
				base.Setint(ColumnNames.DepartementID, value);
			}
		}

		public virtual int SectionID
	    {
			get
	        {
				return base.Getint(ColumnNames.SectionID);
			}
			set
	        {
				base.Setint(ColumnNames.SectionID, value);
			}
		}

		public virtual int VersionID
	    {
			get
	        {
				return base.Getint(ColumnNames.VersionID);
			}
			set
	        {
				base.Setint(ColumnNames.VersionID, value);
			}
		}

		public virtual int AnswerID
	    {
			get
	        {
				return base.Getint(ColumnNames.AnswerID);
			}
			set
	        {
				base.Setint(ColumnNames.AnswerID, value);
			}
		}

		public virtual string QuestionText
	    {
			get
	        {
				return base.Getstring(ColumnNames.QuestionText);
			}
			set
	        {
				base.Setstring(ColumnNames.QuestionText, value);
			}
		}

		public virtual string Description
	    {
			get
	        {
				return base.Getstring(ColumnNames.Description);
			}
			set
	        {
				base.Setstring(ColumnNames.Description, value);
			}
		}

		public virtual int Number
	    {
			get
	        {
				return base.Getint(ColumnNames.Number);
			}
			set
	        {
				base.Setint(ColumnNames.Number, value);
			}
		}

		public virtual string AuditorComment
	    {
			get
	        {
				return base.Getstring(ColumnNames.AuditorComment);
			}
			set
	        {
				base.Setstring(ColumnNames.AuditorComment, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_QuestionID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.QuestionID) ? string.Empty : base.GetintAsString(ColumnNames.QuestionID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.QuestionID);
				else
					this.QuestionID = base.SetintAsString(ColumnNames.QuestionID, value);
			}
		}

		public virtual string s_DepartementID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DepartementID) ? string.Empty : base.GetintAsString(ColumnNames.DepartementID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DepartementID);
				else
					this.DepartementID = base.SetintAsString(ColumnNames.DepartementID, value);
			}
		}

		public virtual string s_SectionID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.SectionID) ? string.Empty : base.GetintAsString(ColumnNames.SectionID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.SectionID);
				else
					this.SectionID = base.SetintAsString(ColumnNames.SectionID, value);
			}
		}

		public virtual string s_VersionID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.VersionID) ? string.Empty : base.GetintAsString(ColumnNames.VersionID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.VersionID);
				else
					this.VersionID = base.SetintAsString(ColumnNames.VersionID, value);
			}
		}

		public virtual string s_AnswerID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.AnswerID) ? string.Empty : base.GetintAsString(ColumnNames.AnswerID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.AnswerID);
				else
					this.AnswerID = base.SetintAsString(ColumnNames.AnswerID, value);
			}
		}

		public virtual string s_QuestionText
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.QuestionText) ? string.Empty : base.GetstringAsString(ColumnNames.QuestionText);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.QuestionText);
				else
					this.QuestionText = base.SetstringAsString(ColumnNames.QuestionText, value);
			}
		}

		public virtual string s_Description
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Description) ? string.Empty : base.GetstringAsString(ColumnNames.Description);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Description);
				else
					this.Description = base.SetstringAsString(ColumnNames.Description, value);
			}
		}

		public virtual string s_Number
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Number) ? string.Empty : base.GetintAsString(ColumnNames.Number);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Number);
				else
					this.Number = base.SetintAsString(ColumnNames.Number, value);
			}
		}

		public virtual string s_AuditorComment
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.AuditorComment) ? string.Empty : base.GetstringAsString(ColumnNames.AuditorComment);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.AuditorComment);
				else
					this.AuditorComment = base.SetstringAsString(ColumnNames.AuditorComment, value);
			}
		}


		#endregion		
	
		#region Where Clause
		public class WhereClause
		{
			public WhereClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffWhereParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffWhereParameter(this);
					}

					return _tearOff;
				}
			}

			#region WhereParameter TearOff's
			public class TearOffWhereParameter
			{
				public TearOffWhereParameter(WhereClause clause)
				{
					this._clause = clause;
				}
				
				
				public WhereParameter QuestionID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.QuestionID, Parameters.QuestionID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter DepartementID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DepartementID, Parameters.DepartementID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter SectionID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.SectionID, Parameters.SectionID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter VersionID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.VersionID, Parameters.VersionID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter AnswerID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.AnswerID, Parameters.AnswerID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter QuestionText
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.QuestionText, Parameters.QuestionText);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Description
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Number
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Number, Parameters.Number);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter AuditorComment
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.AuditorComment, Parameters.AuditorComment);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter QuestionID
		    {
				get
		        {
					if(_QuestionID_W == null)
	        	    {
						_QuestionID_W = TearOff.QuestionID;
					}
					return _QuestionID_W;
				}
			}

			public WhereParameter DepartementID
		    {
				get
		        {
					if(_DepartementID_W == null)
	        	    {
						_DepartementID_W = TearOff.DepartementID;
					}
					return _DepartementID_W;
				}
			}

			public WhereParameter SectionID
		    {
				get
		        {
					if(_SectionID_W == null)
	        	    {
						_SectionID_W = TearOff.SectionID;
					}
					return _SectionID_W;
				}
			}

			public WhereParameter VersionID
		    {
				get
		        {
					if(_VersionID_W == null)
	        	    {
						_VersionID_W = TearOff.VersionID;
					}
					return _VersionID_W;
				}
			}

			public WhereParameter AnswerID
		    {
				get
		        {
					if(_AnswerID_W == null)
	        	    {
						_AnswerID_W = TearOff.AnswerID;
					}
					return _AnswerID_W;
				}
			}

			public WhereParameter QuestionText
		    {
				get
		        {
					if(_QuestionText_W == null)
	        	    {
						_QuestionText_W = TearOff.QuestionText;
					}
					return _QuestionText_W;
				}
			}

			public WhereParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public WhereParameter Number
		    {
				get
		        {
					if(_Number_W == null)
	        	    {
						_Number_W = TearOff.Number;
					}
					return _Number_W;
				}
			}

			public WhereParameter AuditorComment
		    {
				get
		        {
					if(_AuditorComment_W == null)
	        	    {
						_AuditorComment_W = TearOff.AuditorComment;
					}
					return _AuditorComment_W;
				}
			}

			private WhereParameter _QuestionID_W = null;
			private WhereParameter _DepartementID_W = null;
			private WhereParameter _SectionID_W = null;
			private WhereParameter _VersionID_W = null;
			private WhereParameter _AnswerID_W = null;
			private WhereParameter _QuestionText_W = null;
			private WhereParameter _Description_W = null;
			private WhereParameter _Number_W = null;
			private WhereParameter _AuditorComment_W = null;

			public void WhereClauseReset()
			{
				_QuestionID_W = null;
				_DepartementID_W = null;
				_SectionID_W = null;
				_VersionID_W = null;
				_AnswerID_W = null;
				_QuestionText_W = null;
				_Description_W = null;
				_Number_W = null;
				_AuditorComment_W = null;

				this._entity.Query.FlushWhereParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffWhereParameter _tearOff;
			
		}
	
		public WhereClause Where
		{
			get
			{
				if(_whereClause == null)
				{
					_whereClause = new WhereClause(this);
				}
		
				return _whereClause;
			}
		}
		
		private WhereClause _whereClause = null;	
		#endregion
	
		#region Aggregate Clause
		public class AggregateClause
		{
			public AggregateClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffAggregateParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffAggregateParameter(this);
					}

					return _tearOff;
				}
			}

			#region AggregateParameter TearOff's
			public class TearOffAggregateParameter
			{
				public TearOffAggregateParameter(AggregateClause clause)
				{
					this._clause = clause;
				}
				
				
				public AggregateParameter QuestionID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.QuestionID, Parameters.QuestionID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter DepartementID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DepartementID, Parameters.DepartementID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter SectionID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.SectionID, Parameters.SectionID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter VersionID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.VersionID, Parameters.VersionID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter AnswerID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.AnswerID, Parameters.AnswerID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter QuestionText
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.QuestionText, Parameters.QuestionText);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Description
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Number
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Number, Parameters.Number);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter AuditorComment
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.AuditorComment, Parameters.AuditorComment);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter QuestionID
		    {
				get
		        {
					if(_QuestionID_W == null)
	        	    {
						_QuestionID_W = TearOff.QuestionID;
					}
					return _QuestionID_W;
				}
			}

			public AggregateParameter DepartementID
		    {
				get
		        {
					if(_DepartementID_W == null)
	        	    {
						_DepartementID_W = TearOff.DepartementID;
					}
					return _DepartementID_W;
				}
			}

			public AggregateParameter SectionID
		    {
				get
		        {
					if(_SectionID_W == null)
	        	    {
						_SectionID_W = TearOff.SectionID;
					}
					return _SectionID_W;
				}
			}

			public AggregateParameter VersionID
		    {
				get
		        {
					if(_VersionID_W == null)
	        	    {
						_VersionID_W = TearOff.VersionID;
					}
					return _VersionID_W;
				}
			}

			public AggregateParameter AnswerID
		    {
				get
		        {
					if(_AnswerID_W == null)
	        	    {
						_AnswerID_W = TearOff.AnswerID;
					}
					return _AnswerID_W;
				}
			}

			public AggregateParameter QuestionText
		    {
				get
		        {
					if(_QuestionText_W == null)
	        	    {
						_QuestionText_W = TearOff.QuestionText;
					}
					return _QuestionText_W;
				}
			}

			public AggregateParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public AggregateParameter Number
		    {
				get
		        {
					if(_Number_W == null)
	        	    {
						_Number_W = TearOff.Number;
					}
					return _Number_W;
				}
			}

			public AggregateParameter AuditorComment
		    {
				get
		        {
					if(_AuditorComment_W == null)
	        	    {
						_AuditorComment_W = TearOff.AuditorComment;
					}
					return _AuditorComment_W;
				}
			}

			private AggregateParameter _QuestionID_W = null;
			private AggregateParameter _DepartementID_W = null;
			private AggregateParameter _SectionID_W = null;
			private AggregateParameter _VersionID_W = null;
			private AggregateParameter _AnswerID_W = null;
			private AggregateParameter _QuestionText_W = null;
			private AggregateParameter _Description_W = null;
			private AggregateParameter _Number_W = null;
			private AggregateParameter _AuditorComment_W = null;

			public void AggregateClauseReset()
			{
				_QuestionID_W = null;
				_DepartementID_W = null;
				_SectionID_W = null;
				_VersionID_W = null;
				_AnswerID_W = null;
				_QuestionText_W = null;
				_Description_W = null;
				_Number_W = null;
				_AuditorComment_W = null;

				this._entity.Query.FlushAggregateParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffAggregateParameter _tearOff;
			
		}
	
		public AggregateClause Aggregate
		{
			get
			{
				if(_aggregateClause == null)
				{
					_aggregateClause = new AggregateClause(this);
				}
		
				return _aggregateClause;
			}
		}
		
		private AggregateClause _aggregateClause = null;	
		#endregion
	
		protected override IDbCommand GetInsertCommand() 
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_IOSA_QuestionInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.QuestionID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_IOSA_QuestionUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_IOSA_QuestionDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.QuestionID);
			p.SourceColumn = ColumnNames.QuestionID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.QuestionID);
			p.SourceColumn = ColumnNames.QuestionID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.DepartementID);
			p.SourceColumn = ColumnNames.DepartementID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.SectionID);
			p.SourceColumn = ColumnNames.SectionID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.VersionID);
			p.SourceColumn = ColumnNames.VersionID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.AnswerID);
			p.SourceColumn = ColumnNames.AnswerID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.QuestionText);
			p.SourceColumn = ColumnNames.QuestionText;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Description);
			p.SourceColumn = ColumnNames.Description;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Number);
			p.SourceColumn = ColumnNames.Number;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.AuditorComment);
			p.SourceColumn = ColumnNames.AuditorComment;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
