# Glossary Prep — 2026-03-11

이 문서는 Book 맨뒤에 둘 **용어집 초안 준비 문서**다.

원칙:
- `book/chapters`와 `docs/` 전체에서 반복적으로 등장하는 용어를 우선 후보로 삼는다.
- 한국어 설명은 Book 톤에 맞게 짧고 명확하게 적는다.
- 기능/개념/프로토콜/구현체를 섞지 않고 분류해 둔다.

---

## 1. 배치 제안

용어집은 다음 위치가 적절하다:
- **Book 맨뒤**
- 참고 문서 뒤 또는 별도 Appendix

추천 제목:
- `부록 A. 용어집`
- 또는 `Glossary`

---

## 2. 1차 후보 용어 목록

### 프레임워크 / 제품
- LangChain
- LangGraph
- Deep Agents
- LangSmith
- Langfuse
- MCP
- ACP

### 에이전트 / 실행 모델
- Agent
- ReAct
- Workflow
- Orchestrator
- Worker
- Subagent
- Handoff
- Router
- Tool calling
- Structured output
- Middleware
- Human-in-the-Loop
- Interrupt
- Resume
- Durable execution
- Pregel
- Superstep

### 상태 / 메모리
- State
- AgentState
- MessagesState
- Checkpointer
- Thread ID
- Runtime context
- `context_schema`
- `state_schema`
- Short-term memory
- Long-term memory
- Store
- InMemoryStore
- Semantic memory
- Episodic memory
- Procedural memory

### 도구 / 인터페이스
- Tool
- ToolRuntime
- `create_agent()`
- `create_deep_agent()`
- `StateGraph`
- Graph API
- Functional API
- `@entrypoint`
- `@task`
- `Send`
- `Command`

### 백엔드 / 실행 환경
- Backend
- StateBackend
- FilesystemBackend
- StoreBackend
- CompositeBackend
- LocalShellBackend
- Sandbox
- Modal
- Daytona
- Runloop

### 검색 / 데이터
- RAG
- Retriever
- Embedding
- Vector store
- Chunking
- Re-ranking
- SQL Agent
- SQLDatabaseToolkit

### 스트리밍 / 프론트엔드
- Streaming
- StreamEvent
- `useStream`
- Token streaming
- TTFT
- TTFA

### 관측 / 품질
- Tracing
- Evaluation
- LLM-as-Judge
- Trajectory
- Guardrail
- PII

---

## 3. Book에 넣기 좋은 용어집 형식

추천 형식은 표보다 **짧은 사전형 목록**이다.

예시:

```md
## Agent
LLM이 도구를 사용하고 결과를 관찰하며 작업이 끝날 때까지 반복적으로 행동하는 실행 단위.

## Checkpointer
그래프 실행 상태를 저장해, 중단 후 같은 지점에서 다시 시작할 수 있게 하는 구성 요소.
```

이유:
- PDF에서 표보다 줄바꿈/검색성이 좋다.
- 용어별 설명 길이를 유연하게 조절할 수 있다.

---

## 4. 우선 수록 추천 용어

처음부터 너무 많으면 오히려 읽기 어렵기 때문에 아래 25~35개 정도부터 시작하는 것이 좋다.

### 최우선
- LangChain
- LangGraph
- Deep Agents
- Agent
- ReAct
- Tool
- Middleware
- State
- Checkpointer
- Thread ID
- Interrupt
- Human-in-the-Loop
- Durable execution
- Subagent
- Handoff
- Router
- Graph API
- Functional API
- Pregel
- RAG
- Retriever
- Embedding
- Vector store
- Guardrail
- MCP
- ACP

### 2차 확장
- ToolRuntime
- AgentState
- MessagesState
- StoreBackend
- CompositeBackend
- Sandbox
- Trajectory
- LLM-as-Judge
- TTFT
- TTFA

---

## 5. 전체 문서에서 많이 잡히는 후보(정리용)

자동 추출에서 반복도가 높았던 핵심 후보:
- LangChain
- LangGraph
- Deep Agents
- `create_agent`
- `create_deep_agent`
- StateGraph
- checkpointer
- middleware
- context
- memory
- store
- runtime
- thread_id
- RAG
- SQL
- MCP
- ACP
- ToolRuntime
- AgentState
- MessagesState
- HumanInTheLoopMiddleware
- PIIMiddleware
- SummarizationMiddleware
- Send
- Command
- Pregel

---

## 6. 다음 액션

1. 위 용어를 기준으로 Book 맨뒤에 `부록 A. 용어집` 섹션 추가
2. 최우선 용어부터 1문장 정의 작성
3. 필요하면 용어마다 첫 등장 장을 괄호로 덧붙이기  
   예: `Checkpointer (Part 3, 6장)`
