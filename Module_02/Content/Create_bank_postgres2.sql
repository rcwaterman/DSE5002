--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-31 14:25:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4890 (class 1262 OID 17230)
-- Name: bank; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


---ALTER DATABASE bank OWNER TO postgres;

---\connect bank

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 17303)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    account_id integer NOT NULL,
    product_cd character varying(10) NOT NULL,
    cust_id bigint NOT NULL,
    open_date date NOT NULL,
    close_date date,
    last_activity_date date,
    status character varying(6),
    open_branch_id integer,
    open_emp_id integer,
    avail_balance real,
    pending_balance real,
    trial104 character(1)
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17302)
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_account_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 226
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;


--
-- TOC entry 218 (class 1259 OID 17232)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branch_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    address character varying(30),
    city character varying(20),
    state character varying(2),
    zip character varying(12),
    trial104 character(1)
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17231)
-- Name: branch_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_branch_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_branch_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 217
-- Name: branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_branch_id_seq OWNED BY public.branch.branch_id;


--
-- TOC entry 228 (class 1259 OID 17317)
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    cust_id bigint NOT NULL,
    name character varying(40) NOT NULL,
    state_id character varying(10) NOT NULL,
    incorp_date date,
    trial104 character(1)
);


ALTER TABLE public.business OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17247)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    cust_id integer NOT NULL,
    fed_id character varying(12) NOT NULL,
    cust_type_cd character varying(1) NOT NULL,
    address character varying(30),
    city character varying(20),
    state character varying(20),
    postal_code character varying(10),
    trial104 character(1)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17246)
-- Name: customer_cust_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_cust_id_seq OWNER TO postgres;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_cust_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_cust_id_seq OWNED BY public.customer.cust_id;


--
-- TOC entry 222 (class 1259 OID 17262)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    trial104 character(1)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17261)
-- Name: department_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_dept_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_dept_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 221
-- Name: department_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_dept_id_seq OWNED BY public.department.dept_id;


--
-- TOC entry 224 (class 1259 OID 17277)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id smallint NOT NULL,
    fname character varying(20) NOT NULL,
    lname character varying(20) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    superior_emp_id integer,
    dept_id integer,
    title character varying(20),
    assigned_branch_id integer,
    trial104 character(1)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17276)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_emp_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_emp_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 223
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_emp_id_seq OWNED BY public.employee.emp_id;


--
-- TOC entry 229 (class 1259 OID 17328)
-- Name: individual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual (
    cust_id bigint NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    birth_date date,
    trial104 character(1)
);


ALTER TABLE public.individual OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17340)
-- Name: officer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.officer (
    officer_id smallint NOT NULL,
    cust_id bigint NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    title character varying(20),
    start_date date NOT NULL,
    end_date date,
    trial104 character(1)
);


ALTER TABLE public.officer OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17339)
-- Name: officer_officer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.officer_officer_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.officer_officer_id_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 230
-- Name: officer_officer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.officer_officer_id_seq OWNED BY public.officer.officer_id;


--
-- TOC entry 225 (class 1259 OID 17291)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_cd character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    product_type_cd character varying(10) NOT NULL,
    date_offered date,
    date_retired date,
    trial104 character(1)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17355)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    txn_id integer NOT NULL,
    txn_date timestamp without time zone NOT NULL,
    account_id bigint NOT NULL,
    txn_type_cd character varying(3),
    amount double precision NOT NULL,
    teller_emp_id integer,
    execution_branch_id integer,
    funds_avail_date timestamp without time zone,
    trial104 character(1)
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17354)
-- Name: transaction_txn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_txn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_txn_id_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 232
-- Name: transaction_txn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_txn_id_seq OWNED BY public.transaction.txn_id;


--
-- TOC entry 4687 (class 2604 OID 17306)
-- Name: account account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 17235)
-- Name: branch branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN branch_id SET DEFAULT nextval('public.branch_branch_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 17250)
-- Name: customer cust_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_cust_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 17265)
-- Name: department dept_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN dept_id SET DEFAULT nextval('public.department_dept_id_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 17280)
-- Name: employee emp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN emp_id SET DEFAULT nextval('public.employee_emp_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 17343)
-- Name: officer officer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.officer ALTER COLUMN officer_id SET DEFAULT nextval('public.officer_officer_id_seq'::regclass);


--
-- TOC entry 4689 (class 2604 OID 17358)
-- Name: transaction txn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN txn_id SET DEFAULT nextval('public.transaction_txn_id_seq'::regclass);


--
-- TOC entry 4878 (class 0 OID 17303)
-- Dependencies: 227
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account VALUES (1, 'CHK', 1, '2000-01-15', NULL, '2005-01-04', 'ACTIVE', 2, 10, 1057.75, 1057.75, 'T');
INSERT INTO public.account VALUES (2, 'SAV', 1, '2000-01-15', NULL, '2004-12-19', 'ACTIVE', 2, 10, 500, 500, 'T');
INSERT INTO public.account VALUES (3, 'CD', 1, '2004-06-30', NULL, '2004-06-30', 'ACTIVE', 2, 10, 3000, 3000, 'T');
INSERT INTO public.account VALUES (4, 'CHK', 2, '2001-03-12', NULL, '2004-12-27', 'ACTIVE', 2, 10, 2258.02, 2258.02, 'T');
INSERT INTO public.account VALUES (5, 'SAV', 2, '2001-03-12', NULL, '2004-12-11', 'ACTIVE', 2, 10, 200, 200, 'T');
INSERT INTO public.account VALUES (7, 'CHK', 3, '2002-11-23', NULL, '2004-11-30', 'ACTIVE', 3, 13, 1057.75, 1057.75, 'T');
INSERT INTO public.account VALUES (8, 'MM', 3, '2002-12-15', NULL, '2004-12-05', 'ACTIVE', 3, 13, 2212.5, 2212.5, 'T');
INSERT INTO public.account VALUES (10, 'CHK', 4, '2003-09-12', NULL, '2005-01-03', 'ACTIVE', 1, 1, 534.12, 534.12, 'T');
INSERT INTO public.account VALUES (11, 'SAV', 4, '2000-01-15', NULL, '2004-10-24', 'ACTIVE', 1, 1, 767.77, 767.77, 'T');
INSERT INTO public.account VALUES (12, 'MM', 4, '2004-09-30', NULL, '2004-11-11', 'ACTIVE', 1, 1, 5487.09, 5487.09, 'T');
INSERT INTO public.account VALUES (13, 'CHK', 5, '2004-01-27', NULL, '2005-01-05', 'ACTIVE', 4, 16, 2237.97, 2897.97, 'T');
INSERT INTO public.account VALUES (14, 'CHK', 6, '2002-08-24', NULL, '2004-11-29', 'ACTIVE', 1, 1, 122.37, 122.37, 'T');
INSERT INTO public.account VALUES (15, 'CD', 6, '2004-12-28', NULL, '2004-12-28', 'ACTIVE', 1, 1, 10000, 10000, 'T');
INSERT INTO public.account VALUES (17, 'CD', 7, '2004-01-12', NULL, '2004-01-12', 'ACTIVE', 2, 10, 5000, 5000, 'T');
INSERT INTO public.account VALUES (18, 'CHK', 8, '2001-05-23', NULL, '2005-01-03', 'ACTIVE', 4, 16, 3487.19, 3487.19, 'T');
INSERT INTO public.account VALUES (19, 'SAV', 8, '2001-05-23', NULL, '2004-10-12', 'ACTIVE', 4, 16, 387.99, 387.99, 'T');
INSERT INTO public.account VALUES (21, 'CHK', 9, '2003-07-30', NULL, '2004-12-15', 'ACTIVE', 1, 1, 125.67, 125.67, 'T');
INSERT INTO public.account VALUES (22, 'MM', 9, '2004-10-28', NULL, '2004-10-28', 'ACTIVE', 1, 1, 9345.55, 9845.55, 'T');
INSERT INTO public.account VALUES (23, 'CD', 9, '2004-06-30', NULL, '2004-06-30', 'ACTIVE', 1, 1, 1500, 1500, 'T');
INSERT INTO public.account VALUES (24, 'CHK', 10, '2002-09-30', NULL, '2004-12-15', 'ACTIVE', 4, 16, 23575.12, 23575.12, 'T');
INSERT INTO public.account VALUES (25, 'BUS', 10, '2002-10-01', NULL, '2004-08-28', 'ACTIVE', 4, 16, 0, 0, 'T');
INSERT INTO public.account VALUES (27, 'BUS', 11, '2004-03-22', NULL, '2004-11-14', 'ACTIVE', 2, 10, 9345.55, 9345.55, 'T');
INSERT INTO public.account VALUES (28, 'CHK', 12, '2003-07-30', NULL, '2004-12-15', 'ACTIVE', 4, 16, 38552.05, 38552.05, 'T');
INSERT INTO public.account VALUES (29, 'SBL', 13, '2004-02-22', NULL, '2004-12-17', 'ACTIVE', 3, 13, 50000, 50000, 'T');


--
-- TOC entry 4869 (class 0 OID 17232)
-- Dependencies: 218
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.branch VALUES (1, 'Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451', 'T');
INSERT INTO public.branch VALUES (2, 'Woburn Branch', '422 Maple St.', 'Woburn', 'MA', '01801', 'T');
INSERT INTO public.branch VALUES (3, 'Quincy Branch', '125 Presidential Way', 'Quincy', 'MA', '02169', 'T');
INSERT INTO public.branch VALUES (4, 'So. NH Branch', '378 Maynard Ln.', 'Salem', 'NH', '03079', 'T');


--
-- TOC entry 4879 (class 0 OID 17317)
-- Dependencies: 228
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.business VALUES (10, 'Chilton Engineering', '12-345-678', '1995-05-01', 'T');
INSERT INTO public.business VALUES (11, 'Northeast Cooling Inc.', '23-456-789', '2001-01-01', 'T');
INSERT INTO public.business VALUES (12, 'Superior Auto Body', '34-567-890', '2002-06-30', 'T');
INSERT INTO public.business VALUES (13, 'AAA Insurance Inc.', '45-678-901', '1999-05-01', 'T');


--
-- TOC entry 4871 (class 0 OID 17247)
-- Dependencies: 220
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer VALUES (1, '111-11-1111', 'I', '47 Mockingbird Ln', 'Lynnfield', 'MA', '01940', 'T');
INSERT INTO public.customer VALUES (2, '222-22-2222', 'I', '372 Clearwater Blvd', 'Woburn', 'MA', '01801', 'T');
INSERT INTO public.customer VALUES (3, '333-33-3333', 'I', '18 Jessup Rd', 'Quincy', 'MA', '02169', 'T');
INSERT INTO public.customer VALUES (4, '444-44-4444', 'I', '12 Buchanan Ln', 'Waltham', 'MA', '02451', 'T');
INSERT INTO public.customer VALUES (5, '555-55-5555', 'I', '2341 Main St', 'Salem', 'NH', '03079', 'T');
INSERT INTO public.customer VALUES (6, '666-66-6666', 'I', '12 Blaylock Ln', 'Waltham', 'MA', '02451', 'T');
INSERT INTO public.customer VALUES (7, '777-77-7777', 'I', '29 Admiral Ln', 'Wilmington', 'MA', '01887', 'T');
INSERT INTO public.customer VALUES (8, '888-88-8888', 'I', '472 Freedom Rd', 'Salem', 'NH', '03079', 'T');
INSERT INTO public.customer VALUES (9, '999-99-9999', 'I', '29 Maple St', 'Newton', 'MA', '02458', 'T');
INSERT INTO public.customer VALUES (10, '04-1111111', 'B', '7 Industrial Way', 'Salem', 'NH', '03079', 'T');
INSERT INTO public.customer VALUES (11, '04-2222222', 'B', '287A Corporate Ave', 'Wilmington', 'MA', '01887', 'T');
INSERT INTO public.customer VALUES (12, '04-3333333', 'B', '789 Main St', 'Salem', 'NH', '03079', 'T');
INSERT INTO public.customer VALUES (13, '04-4444444', 'B', '4772 Presidential Way', 'Quincy', 'MA', '02169', 'T');


--
-- TOC entry 4873 (class 0 OID 17262)
-- Dependencies: 222
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department VALUES (1, 'Operations', 'T');
INSERT INTO public.department VALUES (2, 'Loans', 'T');
INSERT INTO public.department VALUES (3, 'Administration', 'T');


--
-- TOC entry 4875 (class 0 OID 17277)
-- Dependencies: 224
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee VALUES (1, 'Michael', 'Smith', '2001-06-22', NULL, NULL, 3, 'President', 1, 'T');
INSERT INTO public.employee VALUES (2, 'Susan', 'Barker', '2002-09-12', NULL, 1, 3, 'Vice President', 1, 'T');
INSERT INTO public.employee VALUES (3, 'Robert', 'Tyler', '2000-02-09', NULL, 1, 3, 'Treasurer', 1, 'T');
INSERT INTO public.employee VALUES (4, 'Susan', 'Hawthorne', '2002-04-24', NULL, 3, 1, 'Operations Manager', 1, 'T');
INSERT INTO public.employee VALUES (5, 'John', 'Gooding', '2003-11-14', NULL, 4, 2, 'Loan Manager', 1, 'T');
INSERT INTO public.employee VALUES (6, 'Helen', 'Fleming', '2004-03-17', NULL, 4, 1, 'Head Teller', 1, 'T');
INSERT INTO public.employee VALUES (7, 'Chris', 'Tucker', '2004-09-15', NULL, 6, 1, 'Teller', 1, 'T');
INSERT INTO public.employee VALUES (8, 'Sarah', 'Parker', '2002-12-02', NULL, 6, 1, 'Teller', 1, 'T');
INSERT INTO public.employee VALUES (9, 'Jane', 'Grossman', '2002-05-03', NULL, 6, 1, 'Teller', 1, 'T');
INSERT INTO public.employee VALUES (10, 'Paula', 'Roberts', '2002-07-27', NULL, 4, 1, 'Head Teller', 2, 'T');
INSERT INTO public.employee VALUES (11, 'Thomas', 'Ziegler', '2000-10-23', NULL, 10, 1, 'Teller', 2, 'T');
INSERT INTO public.employee VALUES (12, 'Samantha', 'Jameson', '2003-01-08', NULL, 10, 1, 'Teller', 2, 'T');
INSERT INTO public.employee VALUES (13, 'John', 'Blake', '2000-05-11', NULL, 4, 1, 'Head Teller', 3, 'T');
INSERT INTO public.employee VALUES (14, 'Cindy', 'Mason', '2002-08-09', NULL, 13, 1, 'Teller', 3, 'T');
INSERT INTO public.employee VALUES (15, 'Frank', 'Portman', '2003-04-01', NULL, 13, 1, 'Teller', 3, 'T');
INSERT INTO public.employee VALUES (16, 'Theresa', 'Markham', '2001-03-15', NULL, 4, 1, 'Head Teller', 4, 'T');
INSERT INTO public.employee VALUES (17, 'Beth', 'Fowler', '2002-06-29', NULL, 16, 1, 'Teller', 4, 'T');
INSERT INTO public.employee VALUES (18, 'Rick', 'Tulman', '2002-12-12', NULL, 16, 1, 'Teller', 4, 'T');


--
-- TOC entry 4880 (class 0 OID 17328)
-- Dependencies: 229
-- Data for Name: individual; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.individual VALUES (1, 'James', 'Hadley', '1972-04-22', 'T');
INSERT INTO public.individual VALUES (2, 'Susan', 'Tingley', '1968-08-15', 'T');
INSERT INTO public.individual VALUES (3, 'Frank', 'Tucker', '1958-02-06', 'T');
INSERT INTO public.individual VALUES (4, 'John', 'Hayward', '1966-12-22', 'T');
INSERT INTO public.individual VALUES (5, 'Charles', 'Frasier', '1971-08-25', 'T');
INSERT INTO public.individual VALUES (6, 'John', 'Spencer', '1962-09-14', 'T');
INSERT INTO public.individual VALUES (7, 'Margaret', 'Young', '1947-03-19', 'T');
INSERT INTO public.individual VALUES (8, 'Louis', 'Blake', '1977-07-01', 'T');
INSERT INTO public.individual VALUES (9, 'Richard', 'Farley', '1968-06-16', 'T');


--
-- TOC entry 4882 (class 0 OID 17340)
-- Dependencies: 231
-- Data for Name: officer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.officer VALUES (1, 10, 'John', 'Chilton', 'President', '1995-05-01', NULL, 'T');
INSERT INTO public.officer VALUES (2, 11, 'Paul', 'Hardy', 'President', '2001-01-01', NULL, 'T');
INSERT INTO public.officer VALUES (3, 12, 'Carl', 'Lutz', 'President', '2002-06-30', NULL, 'T');
INSERT INTO public.officer VALUES (4, 13, 'Stanley', 'Cheswick', 'President', '1999-05-01', NULL, 'T');


--
-- TOC entry 4876 (class 0 OID 17291)
-- Dependencies: 225
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES ('AUT', 'auto loan', 'LOAN', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('BUS', 'business line of credit', 'LOAN', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('CD', 'certificate of deposit', 'ACCOUNT', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('CHK', 'checking account', 'ACCOUNT', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('MM', 'money market account', 'ACCOUNT', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('MRT', 'home mortgage', 'LOAN', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('SAV', 'savings account', 'ACCOUNT', '2000-01-01', NULL, 'T');
INSERT INTO public.product VALUES ('SBL', 'small business loan', 'LOAN', '2000-01-01', NULL, 'T');


--
-- TOC entry 4884 (class 0 OID 17355)
-- Dependencies: 233
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction VALUES (1, '2000-01-15 00:00:00', 1, 'CDT', 100, NULL, NULL, '2000-01-15 00:00:00', 'T');
INSERT INTO public.transaction VALUES (2, '2000-01-15 00:00:00', 2, 'CDT', 100, NULL, NULL, '2000-01-15 00:00:00', 'T');
INSERT INTO public.transaction VALUES (3, '2004-06-30 00:00:00', 3, 'CDT', 100, NULL, NULL, '2004-06-30 00:00:00', 'T');
INSERT INTO public.transaction VALUES (4, '2001-03-12 00:00:00', 4, 'CDT', 100, NULL, NULL, '2001-03-12 00:00:00', 'T');
INSERT INTO public.transaction VALUES (5, '2001-03-12 00:00:00', 5, 'CDT', 100, NULL, NULL, '2001-03-12 00:00:00', 'T');
INSERT INTO public.transaction VALUES (6, '2002-11-23 00:00:00', 7, 'CDT', 100, NULL, NULL, '2002-11-23 00:00:00', 'T');
INSERT INTO public.transaction VALUES (7, '2002-12-15 00:00:00', 8, 'CDT', 100, NULL, NULL, '2002-12-15 00:00:00', 'T');
INSERT INTO public.transaction VALUES (8, '2003-09-12 00:00:00', 10, 'CDT', 100, NULL, NULL, '2003-09-12 00:00:00', 'T');
INSERT INTO public.transaction VALUES (9, '2000-01-15 00:00:00', 11, 'CDT', 100, NULL, NULL, '2000-01-15 00:00:00', 'T');
INSERT INTO public.transaction VALUES (10, '2004-09-30 00:00:00', 12, 'CDT', 100, NULL, NULL, '2004-09-30 00:00:00', 'T');
INSERT INTO public.transaction VALUES (11, '2004-01-27 00:00:00', 13, 'CDT', 100, NULL, NULL, '2004-01-27 00:00:00', 'T');
INSERT INTO public.transaction VALUES (12, '2002-08-24 00:00:00', 14, 'CDT', 100, NULL, NULL, '2002-08-24 00:00:00', 'T');
INSERT INTO public.transaction VALUES (13, '2004-12-28 00:00:00', 15, 'CDT', 100, NULL, NULL, '2004-12-28 00:00:00', 'T');
INSERT INTO public.transaction VALUES (14, '2004-01-12 00:00:00', 17, 'CDT', 100, NULL, NULL, '2004-01-12 00:00:00', 'T');
INSERT INTO public.transaction VALUES (15, '2001-05-23 00:00:00', 18, 'CDT', 100, NULL, NULL, '2001-05-23 00:00:00', 'T');
INSERT INTO public.transaction VALUES (16, '2001-05-23 00:00:00', 19, 'CDT', 100, NULL, NULL, '2001-05-23 00:00:00', 'T');
INSERT INTO public.transaction VALUES (17, '2003-07-30 00:00:00', 21, 'CDT', 100, NULL, NULL, '2003-07-30 00:00:00', 'T');
INSERT INTO public.transaction VALUES (18, '2004-10-28 00:00:00', 22, 'CDT', 100, NULL, NULL, '2004-10-28 00:00:00', 'T');
INSERT INTO public.transaction VALUES (19, '2004-06-30 00:00:00', 23, 'CDT', 100, NULL, NULL, '2004-06-30 00:00:00', 'T');
INSERT INTO public.transaction VALUES (20, '2002-09-30 00:00:00', 24, 'CDT', 100, NULL, NULL, '2002-09-30 00:00:00', 'T');
INSERT INTO public.transaction VALUES (21, '2003-07-30 00:00:00', 28, 'CDT', 100, NULL, NULL, '2003-07-30 00:00:00', 'T');


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 226
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_account_id_seq', 29, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 217
-- Name: branch_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_branch_id_seq', 4, true);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_cust_id_seq', 13, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 221
-- Name: department_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_dept_id_seq', 3, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 223
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_emp_id_seq', 18, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 230
-- Name: officer_officer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.officer_officer_id_seq', 4, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 232
-- Name: transaction_txn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_txn_id_seq', 21, true);


--
-- TOC entry 4701 (class 2606 OID 17316)
-- Name: account pk_account; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT pk_account PRIMARY KEY (account_id);


--
-- TOC entry 4691 (class 2606 OID 17245)
-- Name: branch pk_branch; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT pk_branch PRIMARY KEY (branch_id);


--
-- TOC entry 4703 (class 2606 OID 17327)
-- Name: business pk_business; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT pk_business PRIMARY KEY (cust_id);


--
-- TOC entry 4693 (class 2606 OID 17260)
-- Name: customer pk_customer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (cust_id);


--
-- TOC entry 4695 (class 2606 OID 17275)
-- Name: department pk_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT pk_department PRIMARY KEY (dept_id);


--
-- TOC entry 4697 (class 2606 OID 17290)
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id);


--
-- TOC entry 4705 (class 2606 OID 17338)
-- Name: individual pk_individual; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT pk_individual PRIMARY KEY (cust_id);


--
-- TOC entry 4707 (class 2606 OID 17353)
-- Name: officer pk_officer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.officer
    ADD CONSTRAINT pk_officer PRIMARY KEY (officer_id);


--
-- TOC entry 4699 (class 2606 OID 17301)
-- Name: product pk_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product PRIMARY KEY (product_cd);


--
-- TOC entry 4709 (class 2606 OID 17368)
-- Name: transaction pk_transaction; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT pk_transaction PRIMARY KEY (txn_id);


--
-- TOC entry 4713 (class 2606 OID 17384)
-- Name: account fk_a_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_branch_id FOREIGN KEY (open_branch_id) REFERENCES public.branch(branch_id);


--
-- TOC entry 4714 (class 2606 OID 17389)
-- Name: account fk_a_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- TOC entry 4715 (class 2606 OID 17394)
-- Name: account fk_a_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_emp_id FOREIGN KEY (open_emp_id) REFERENCES public.employee(emp_id);


--
-- TOC entry 4717 (class 2606 OID 17404)
-- Name: business fk_b_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT fk_b_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- TOC entry 4710 (class 2606 OID 17369)
-- Name: employee fk_dept_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_dept_id FOREIGN KEY (dept_id) REFERENCES public.department(dept_id);


--
-- TOC entry 4711 (class 2606 OID 17374)
-- Name: employee fk_e_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_e_branch_id FOREIGN KEY (assigned_branch_id) REFERENCES public.branch(branch_id);


--
-- TOC entry 4712 (class 2606 OID 17379)
-- Name: employee fk_e_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_e_emp_id FOREIGN KEY (superior_emp_id) REFERENCES public.employee(emp_id);


--
-- TOC entry 4720 (class 2606 OID 17419)
-- Name: transaction fk_exec_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_exec_branch_id FOREIGN KEY (execution_branch_id) REFERENCES public.branch(branch_id);


--
-- TOC entry 4718 (class 2606 OID 17409)
-- Name: individual fk_i_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT fk_i_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- TOC entry 4719 (class 2606 OID 17414)
-- Name: officer fk_o_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.officer
    ADD CONSTRAINT fk_o_cust_id FOREIGN KEY (cust_id) REFERENCES public.business(cust_id);


--
-- TOC entry 4716 (class 2606 OID 17399)
-- Name: account fk_product_cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_product_cd FOREIGN KEY (product_cd) REFERENCES public.product(product_cd);


--
-- TOC entry 4721 (class 2606 OID 17424)
-- Name: transaction fk_t_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_t_account_id FOREIGN KEY (account_id) REFERENCES public.account(account_id);


--
-- TOC entry 4722 (class 2606 OID 17429)
-- Name: transaction fk_teller_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_teller_emp_id FOREIGN KEY (teller_emp_id) REFERENCES public.employee(emp_id);


-- Completed on 2025-01-31 14:25:14

--
-- PostgreSQL database dump complete
--

