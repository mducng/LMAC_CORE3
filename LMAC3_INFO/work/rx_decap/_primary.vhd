library verilog;
use verilog.vl_types.all;
entity rx_decap is
    generic(
        FMAC_ID         : integer := 10;
        RX_FIFO_DEPTH   : integer := 4096;
        RX_FIFO_ADDR_WIDTH: integer := 12;
        RX_DRAM_DEPTH   : integer := 3072;
        RX_DRAM_ADDR_WIDTH: integer := 12;
        DATA_WIDTH      : integer := 256;
        RX_PKT_CNT_ADDR : integer := 40;
        RX_BYTE_CNT_ADDR: integer := 56;
        PKT_CNT_OVERSIZE_ADDR: integer := 96;
        PKT_CNT_JABBER_ADDR: integer := 120;
        PKT_CNT_FRAGMENT_ADDR: integer := 128;
        PKT_RCV_ADDR64  : integer := 0;
        PKT_RCV_ADDR127 : integer := 8;
        PKT_RCV_ADDR255 : integer := 16;
        PKT_RCV_ADDR511 : integer := 24;
        PKT_RCV_ADDR1023: integer := 32;
        PKT_RCV_ADDR1518: integer := 40;
        PKT_RCV_ADDR2047: integer := 48;
        PKT_RCV_ADDR4095: integer := 56;
        PKT_RCV_ADDR8191: integer := 64;
        PKT_RCV_ADDR9018: integer := 72;
        PKT_RCV_ADDR9022: integer := 80;
        PKT_RCV_ADDR9199P: integer := 88;
        PKT_RCV_ADDR_BCAST: integer := 96;
        PKT_RCV_ADDR_MCAST: integer := 104
    );
    port(
        clk250          : in     vl_logic;
        clk156          : in     vl_logic;
        \rst_\          : in     vl_logic;
        full            : in     vl_logic;
        usedw           : in     vl_logic_vector;
        rx_check_crc    : in     vl_logic;
        fmac_ctrl1_dly  : in     vl_logic_vector(31 downto 0);
        fmac_rxd_en     : in     vl_logic;
        FMAC_RX_CRC_ERR_CNT: out    vl_logic_vector(31 downto 0);
        FMAC_RX_UNDERSIZE_PKT_CNT: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT_LO: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_BYTE_CNT_LO: out    vl_logic_vector(31 downto 0);
        FMAC_RX_BYTE_CNT_HI: out    vl_logic_vector(31 downto 0);
        FMAC_PKT_CNT_JABBER: out    vl_logic_vector(31 downto 0);
        FMAC_PKT_CNT_FRAGMENT: out    vl_logic_vector(31 downto 0);
        STAT_GROUP_LO_DOUT: out    vl_logic_vector(31 downto 0);
        STAT_GROUP_HI_DOUT: out    vl_logic_vector(31 downto 0);
        STAT_GROUP_addr : in     vl_logic_vector(9 downto 0);
        STAT_GROUP_sel  : in     vl_logic;
        fmac_rx_clr_en  : in     vl_logic;
        wptr            : in     vl_logic_vector;
        rdata           : in     vl_logic_vector;
        add_lo_bcast    : in     vl_logic;
        add_lo_mcast    : in     vl_logic;
        clr_carry_cast  : in     vl_logic;
        add_hi_cast     : in     vl_logic;
        clr_pkt_cnt_oversize: out    vl_logic;
        tx_xo_en        : in     vl_logic;
        xdone           : in     vl_logic;
        FMAC_RX_PKT_CNT64_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT64_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT127_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT127_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT255_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT255_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT511_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT511_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT1023_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT1023_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT1518_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT1518_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT2047_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT2047_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT4095_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT4095_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT8191_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT8191_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT9018_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT9018_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT9022_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT9022_HI: out    vl_logic_vector(31 downto 0);
        FMAC_RX_PKT_CNT9199P_LO: out    vl_logic_vector(32 downto 0);
        FMAC_RX_PKT_CNT9199P_HI: out    vl_logic_vector(31 downto 0);
        nbyte           : in     vl_logic_vector(15 downto 0);
        pkt_done        : in     vl_logic;
        crc_chk         : in     vl_logic_vector(31 downto 0);
        crc32           : in     vl_logic_vector(31 downto 0);
        \crc32_vld_\    : in     vl_logic;
        crc_ok          : in     vl_logic
    );
end rx_decap;