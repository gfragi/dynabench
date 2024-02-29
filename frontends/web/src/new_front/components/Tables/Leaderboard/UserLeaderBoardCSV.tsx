import React, { FC, useEffect, useState } from "react";
import { Dropdown, DropdownButton } from "react-bootstrap";
import BootstrapTable from "react-bootstrap-table-next";
import paginationFactory from "react-bootstrap-table2-paginator";
import { PacmanLoader } from "react-spinners";
import useFetch from "use-http";
import filterFactory, { textFilter } from "react-bootstrap-table2-filter";
import { Modal } from "react-bootstrap";
import LeaderboardDescription from "new_front/components/Tables/Leaderboard/LeaderboardDescription";
import GeneralButton from "new_front/components/Buttons/GeneralButton";

type LeaderBoardHeaderValuesProps = {
  title: string;
  value: string;
};

type UserLeaderBoardCSVProps = {
  taskId: number;
  title?: string;
  leaderboard_description?: any;
};

type HeaderLeaderboardValuesProps = {
  leaderBoardHeaderValues: any[];
};

const HeaderLeaderboardValues = ({
  leaderBoardHeaderValues,
}: HeaderLeaderboardValuesProps) => {
  return (
    <div className="flex flex-col justify-start gap-2 pb-2">
      {leaderBoardHeaderValues.map((headerValue, key) => (
        <div className="flex flex-row justify-between gap-12 " key={key}>
          <h2 className="m-0 text-base text-reset">{headerValue.title}:</h2>
          <span className="text-base font-semibold text-letter-color">
            {headerValue.value}
          </span>
        </div>
      ))}
    </div>
  );
};

type BodyLeaderboardValuesProps = {
  title: string | undefined;
  data: any[];
  columns: any[];
  rounds: number[] | undefined;
  round: number | undefined;
  setRound: (round: number | undefined) => void;
  downloadCSV: (round?: { round: number }) => void;
  showModal: boolean;
  setShowModal: (showModal: boolean) => void;
};

const BodyLeaderboardValues = ({
  title,
  data,
  columns,
  rounds,
  round,
  setRound,
  downloadCSV,
  showModal,
  setShowModal,
}: BodyLeaderboardValuesProps) => {
  const pageButtonRenderer = ({ page, onPageChange }: any) => {
    const handleClick = (e: any) => {
      e.preventDefault();
      onPageChange(page);
    };

    return (
      <li className="mb-2 page-item ">
        <a
          href="/"
          className="page-link"
          onClick={handleClick}
          style={{ color: "#4a5568" }}
        >
          {page}
        </a>
      </li>
    );
  };

  return (
    <div className="overflow-x-auto border border-gray-200 rounded-lg bg-gray-100/40">
      <div className="">
        <div className="flex flex-row items-center justify-between px-4 py-2">
          <div className="flex flex-col">
            <h2 className="m-0 text-base text-uppercase text-reset">
              {title ? title : "Example Leaderboard"}
            </h2>
          </div>
          <DropdownButton
            variant="light"
            className="font-bold border-0 font-weight-bold text-letter-color"
            style={{ marginRight: 10 }}
            id="dropdown-basic-button"
            title={round ? `Round ${round}` : "All"}
          >
            <Dropdown.Item
              key={round}
              onClick={() => {
                setRound(undefined);
                downloadCSV();
              }}
            >
              All
            </Dropdown.Item>
            {rounds &&
              rounds.map((round) => (
                <Dropdown.Item
                  key={round}
                  onClick={() => {
                    setRound(round);
                    downloadCSV({ round });
                  }}
                >
                  Round {round}
                </Dropdown.Item>
              ))}
          </DropdownButton>
          <button onClick={() => setShowModal(!showModal)} id="amplyfi-button">
            <i className="fas fa-bars"></i>
          </button>
        </div>
      </div>
      <div className="bg-white">
        <BootstrapTable
          keyField="id"
          data={data}
          columns={columns}
          sort={{ dataField: "score", order: "desc" }}
          filter={filterFactory()}
          pagination={paginationFactory({
            sizePerPage: 15,
            showTotal: true,
            pageButtonRenderer,
            hideSizePerPage: true,
            hidePageListOnlyOnePage: true,
            paginationTotalRenderer(from, to, size) {
              return (
                <div className="flex flex-row items-center justify-between">
                  <span className="pt-2 ml-3 ">
                    Showing {from} to {to} of {size}
                  </span>
                </div>
              );
            },
          })}
        />
      </div>
    </div>
  );
};

const UserLeaderBoardCSV: FC<UserLeaderBoardCSVProps> = ({
  taskId,
  title,
  leaderboard_description,
}) => {
  const [data, setData] = useState([]);
  const [round, setRound] = useState<number | undefined>(undefined);
  const [isLoading, setIsLoading] = useState(false);
  const [showModal, setShowModal] = useState(false);
  const [rounds, setRounds] = useState<number[] | undefined>(undefined);
  const [showDescription, setShowDescription] = useState(false);
  const [leaderBoardHeaderValues, setLeaderBoardHeaderValues] = useState<
    LeaderBoardHeaderValuesProps[]
  >([]);
  const { post, response } = useFetch();

  const downloadCSV = async ({
    round,
  }: {
    round?: number;
  } = {}) => {
    setIsLoading(true);
    const csvData = await post("/score/read_users_score_csv/", {
      task_id: taskId,
      round_id: round,
    });
    if (response.ok) {
      setData(JSON.parse(csvData.data));
      setRounds(csvData.rounds);
      setIsLoading(false);
    }
  };

  const getLeaderBoardHeaderValues = async () => {
    setIsLoading(true);
    const leaderBoardHeaderValues = await post(
      "/score/read_leaderboard_metadata/",
      {
        task_id: taskId,
        round_id: round,
      },
    );
    if (response.ok) {
      setLeaderBoardHeaderValues(leaderBoardHeaderValues);
      setIsLoading(false);
    }
  };

  useEffect(() => {
    async function fetchData() {
      await downloadCSV();
      await getLeaderBoardHeaderValues();
    }
    fetchData();
  }, []);

  function priceFormatter(column: { text: string }) {
    return (
      <div className="flex flex-row capitalize cursor-pointer">
        <span className="text-[0.85rem] text-letter-color">{column.text}</span>
        <svg
          className="w-3 h-3 mt-1 ml-1 "
          fill="currentColor"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 19 20"
        >
          <path d="M15 20V5h3l-5.1-5L8 5h3v15zM2 0v15h-3l4.9 5L9 15H6V0z" />
        </svg>
      </div>
    );
  }

  const columns =
    data.length > 0
      ? Object.keys(data[0]).map((key) => ({
          dataField: key,
          text: key,
          sort: true,
          filter: textFilter(),
          headerFormatter: priceFormatter,
        }))
      : [];

  console.log("leaderBoardHeaderValues", leaderBoardHeaderValues);

  return (
    <>
      {!isLoading ? (
        <>
          <div className="flex flex-col justify-start gap-2 pb-2">
            {leaderBoardHeaderValues.length > 0 && (
              <HeaderLeaderboardValues
                leaderBoardHeaderValues={leaderBoardHeaderValues}
              />
            )}
            <GeneralButton
              text="Show Metrics Description"
              onClick={() => setShowDescription(!showDescription)}
              className="max-w-xs border-0 font-weight-bold light-gray-bg task-action-btn"
            />
          </div>
          {data.length > 0 && (
            <BodyLeaderboardValues
              title={title}
              data={data}
              columns={columns}
              rounds={rounds}
              round={round}
              setRound={setRound}
              downloadCSV={downloadCSV}
              showModal={showModal}
              setShowModal={setShowModal}
            />
          )}
          {showModal && (
            <>
              <Modal
                show={showModal}
                onHide={() => setShowModal(!showModal)}
                size="lg"
                aria-labelledby="contained-modal-title-vcenter"
                centered
              >
                <Modal.Header closeButton>
                  <Modal.Title>Leaderboard Options</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                  <HeaderLeaderboardValues
                    leaderBoardHeaderValues={leaderBoardHeaderValues}
                  />
                  <BodyLeaderboardValues
                    title={title}
                    data={data}
                    columns={columns}
                    rounds={rounds}
                    round={round}
                    setRound={setRound}
                    downloadCSV={downloadCSV}
                    showModal={showModal}
                    setShowModal={setShowModal}
                  />
                </Modal.Body>
              </Modal>
            </>
          )}
          {showDescription && (
            <LeaderboardDescription description={leaderboard_description} />
          )}
        </>
      ) : (
        <div className="flex items-center justify-center h-32">
          <PacmanLoader color="#ccebd4" loading={isLoading} size={50} />
        </div>
      )}
    </>
  );
};

export default UserLeaderBoardCSV;
