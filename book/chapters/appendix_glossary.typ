// appendix_glossary.typ — Glossary appendix
#import "../template.typ": *
#import "../metadata.typ": *

#pagebreak(weak: true)

// Hidden heading for TOC
#heading(level: 1)[부록 A. 용어집]

#let glossary-item(term, desc) = [
  #text(weight: "bold", fill: color-secondary)[#term]
  #h(6pt)
  #desc
  #v(8pt)
]

// Visual appendix title
#grid(
  columns: (auto, 1fr),
  column-gutter: 14pt,
  align: (right + bottom, left + bottom),
  text(
    size: 48pt,
    weight: "bold",
    fill: luma(220),
    font: font-body,
  )[A],
  {
    text(size: 22pt, weight: "bold", fill: color-secondary, tracking: 0.3pt)[부록 A. 용어집]
    v(2pt)
    text(size: 11pt, fill: luma(130), style: "italic")[Book 전체에서 반복 등장하는 핵심 용어]
  },
)
#v(8pt)
#line(length: 100%, stroke: 0.5pt + luma(220))
#v(16pt)

이 부록은 책 전반에서 자주 등장하는 핵심 용어를 한 번에 다시 찾아볼 수 있도록 정리한 참고 섹션입니다. 처음부터 모두 외울 필요는 없으며, 낯선 용어가 나올 때마다 다시 찾아보는 방식으로 활용하면 됩니다.

#note-box[용어집의 목적은 API 문서를 대체하는 것이 아니라, _책을 읽을 때 자주 마주치는 개념을 빠르게 재확인_할 수 있게 하는 데 있습니다. 구현 세부사항은 각 장의 본문과 참고 문서를 함께 보세요.]

== 프레임워크와 제품

#glossary-item([LangChain], [모델, 도구, 프롬프트, 미들웨어를 조합해 에이전트와 LLM 애플리케이션을 빠르게 만드는 상위 프레임워크입니다.])
#glossary-item([LangGraph], [상태, 노드, 엣지, 체크포인터를 기반으로 복잡한 워크플로와 장기 실행형 에이전트를 오케스트레이션하는 런타임/프레임워크입니다.])
#glossary-item([Deep Agents], [LangGraph 위에 계획, 파일시스템, 서브에이전트, 메모리, 샌드박스 같은 하네스 기능을 얹은 올인원 에이전트 SDK입니다.])
#glossary-item([LangSmith], [트레이싱, 평가, 데이터셋 관리, 디버깅을 지원하는 관측성과 품질 관리 플랫폼입니다.])
#glossary-item([Langfuse], [트레이싱과 관측성 수집을 위한 오픈소스 계열의 observability 도구입니다.])
#glossary-item([MCP], [Model Context Protocol의 약자로, 외부 도구와 리소스를 모델/에이전트에 표준 방식으로 연결하는 프로토콜입니다.])
#glossary-item([ACP], [Agent Client Protocol의 약자로, 에이전트를 에디터나 IDE 같은 클라이언트에 연결하기 위한 통신 프로토콜입니다.])

== 에이전트와 실행 모델

#glossary-item([Agent], [LLM이 도구를 사용하고 결과를 관찰하며 작업이 끝날 때까지 반복적으로 행동하는 실행 단위입니다.])
#glossary-item([ReAct], [Reasoning + Acting의 줄임말로, 모델이 추론과 도구 사용을 반복하며 문제를 해결하는 대표적인 에이전트 패턴입니다.])
#glossary-item([Workflow], [단계와 순서가 비교적 명확하게 정의된 실행 흐름입니다. 에이전트보다 결정론적 성격이 강합니다.])
#glossary-item([Orchestrator], [여러 단계나 여러 워커의 작업을 조정하고 전체 흐름을 관리하는 상위 제어자입니다.])
#glossary-item([Worker], [오케스트레이터에게 위임받은 특정 작업을 수행하는 실행 단위입니다.])
#glossary-item([Subagent], [메인 에이전트가 세부 작업을 위임하기 위해 호출하는 보조 에이전트입니다. 독립된 컨텍스트를 갖는 경우가 많습니다.])
#glossary-item([Handoff], [현재 단계나 상태에 따라 다른 역할/에이전트로 제어를 넘기는 패턴입니다.])
#glossary-item([Router], [입력이나 상태를 분류하여 적절한 처리 경로나 전문 에이전트로 보내는 패턴입니다.])
#glossary-item([Human-in-the-Loop], [민감한 도구 실행이나 중요한 분기 지점에서 사람의 승인·수정·거부를 끼워 넣는 안전 장치입니다.])
#glossary-item([Interrupt], [그래프나 에이전트 실행을 중간에서 멈추고 외부 입력을 기다리게 만드는 메커니즘입니다.])
#glossary-item([Resume], [중단된 실행을 이전 상태에서 다시 이어가는 동작입니다. 보통 같은 `thread_id`와 체크포인터가 필요합니다.])
#glossary-item([Durable Execution], [실행 상태를 저장해 두었다가 장애나 중단 이후 마지막 성공 지점부터 다시 시작할 수 있게 하는 실행 방식입니다.])
#glossary-item([Pregel], [LangGraph 내부 실행 모델에 영향을 준 메시지 패싱 기반 계산 모델입니다. 노드가 슈퍼스텝 단위로 동작합니다.])
#glossary-item([Superstep], [Pregel 모델에서 여러 노드가 한 라운드로 실행되는 병렬 계산 단위를 뜻합니다.])

== 상태와 메모리

#glossary-item([State], [에이전트나 그래프가 실행되는 동안 유지·업데이트하는 현재 작업 정보 묶음입니다.])
#glossary-item([AgentState], [LangChain/에이전트 실행에서 사용하는 기본 상태 스키마입니다. `messages` 등 예약 필드를 포함합니다.])
#glossary-item([MessagesState], [메시지 리스트를 중심으로 상태를 관리하는 LangGraph의 편의 상태 타입입니다.])
#glossary-item([Checkpointer], [실행 상태를 저장하고 복구하는 컴포넌트입니다. 멀티턴 대화, interrupt/resume, durable execution의 핵심입니다.])
#glossary-item([Thread ID], [하나의 대화/실행 흐름을 식별하는 고유 ID입니다. 같은 `thread_id`를 사용해야 이전 상태를 이어서 불러올 수 있습니다.])
#glossary-item([Runtime Context], [실행 시점에만 주입되는 메타데이터·권한·사용자 정보 같은 컨텍스트입니다.])
#glossary-item([`context_schema`], [실행 중 변하지 않는 정적 컨텍스트의 구조를 정의하는 스키마입니다.])
#glossary-item([`state_schema`], [실행 중 계속 변하는 동적 상태의 구조를 정의하는 스키마입니다.])
#glossary-item([Short-term memory], [하나의 스레드나 대화 안에서만 유지되는 메모리입니다. 주로 메시지 히스토리와 최근 작업 상태를 뜻합니다.])
#glossary-item([Long-term memory], [대화가 끝난 뒤에도 남아 다음 스레드에서 재사용되는 메모리입니다. 사용자 선호도, 학습 결과 등에 적합합니다.])
#glossary-item([Store], [스레드 바깥의 장기 데이터를 저장하고 검색하는 저장 계층입니다.])
#glossary-item([InMemoryStore], [메모리 기반의 간단한 Store 구현입니다. 개발과 테스트에는 편리하지만 재시작 시 데이터가 사라집니다.])
#glossary-item([Semantic memory], [사실·선호도·개념처럼 의미 기반으로 다시 찾아 쓸 수 있는 장기 기억입니다.])
#glossary-item([Episodic memory], [특정 사건이나 상호작용 기록처럼 시간 순서가 중요한 기억입니다.])
#glossary-item([Procedural memory], [에이전트가 따라야 할 규칙, 절차, 행동 방식에 해당하는 기억입니다.])

== 도구와 인터페이스

#glossary-item([Tool], [에이전트가 호출할 수 있는 함수나 외부 작업 인터페이스입니다. 검색, 계산, 파일 읽기, API 호출 등이 여기에 해당합니다.])
#glossary-item([ToolRuntime], [도구 실행 중 현재 상태, 컨텍스트, Store 등에 접근할 수 있게 해 주는 런타임 객체입니다.])
#glossary-item([`create_agent()`], [LangChain에서 기본 에이전트를 빠르게 생성하는 핵심 API입니다.])
#glossary-item([`create_deep_agent()`], [Deep Agents에서 계획, 파일, 서브에이전트 등을 포함한 하네스형 에이전트를 생성하는 API입니다.])
#glossary-item([`StateGraph`], [LangGraph에서 상태 기반 그래프 워크플로를 정의하는 빌더 클래스입니다.])
#glossary-item([Graph API], [노드와 엣지를 명시적으로 선언해 그래프를 조립하는 LangGraph 프로그래밍 방식입니다.])
#glossary-item([Functional API], [Python 함수와 `@entrypoint`, `@task`로 워크플로를 표현하는 LangGraph 프로그래밍 방식입니다.])
#glossary-item([`@entrypoint`], [Functional API에서 워크플로의 시작 함수를 정의하는 데코레이터입니다.])
#glossary-item([`@task`], [내구성 보장이 필요한 작업 단위를 감싸는 Functional API 데코레이터입니다.])
#glossary-item([`Send`], [LangGraph에서 동적으로 여러 워커 실행을 fan-out하는 데 쓰이는 API입니다.])
#glossary-item([`Command`], [상태 업데이트, resume, 부모 그래프 전이 등을 표현하는 LangGraph의 제어 객체입니다.])
#glossary-item([Structured output], [모델의 응답을 Pydantic 스키마나 명시된 구조로 강제하는 출력 방식입니다.])

== 백엔드와 실행 환경

#glossary-item([Backend], [Deep Agents에서 파일 읽기/쓰기와 실행 환경을 추상화하는 저장·실행 계층입니다.])
#glossary-item([StateBackend], [대화 스레드 안에서만 유지되는 에페메럴 파일 저장 백엔드입니다.])
#glossary-item([FilesystemBackend], [로컬 디스크에 접근하는 백엔드입니다. `virtual_mode=True`로 경로 제한을 두는 것이 일반적입니다.])
#glossary-item([StoreBackend], [LangGraph Store를 사용해 스레드 간 영속 저장을 제공하는 백엔드입니다.])
#glossary-item([CompositeBackend], [경로별로 서로 다른 백엔드에 요청을 라우팅하는 혼합형 백엔드입니다.])
#glossary-item([LocalShellBackend], [로컬 파일 접근에 더해 셸 명령 실행까지 제공하는 강력하지만 위험한 백엔드입니다.])
#glossary-item([Sandbox], [호스트와 격리된 환경에서 코드 실행과 파일 작업을 수행하게 하는 실행 환경입니다.])
#glossary-item([Modal], [GPU와 AI/ML 워크로드에 강한 샌드박스/서버리스 실행 환경입니다.])
#glossary-item([Daytona], [빠른 devbox provisioning과 개발 환경 중심 사용 사례에 적합한 샌드박스 제공자입니다.])
#glossary-item([Runloop], [일회성 devbox와 격리 실행에 적합한 샌드박스 제공자입니다.])

== 검색, 스트리밍, 품질 관리

#glossary-item([RAG], [Retrieval-Augmented Generation의 약자로, 외부 지식을 검색해 모델 응답에 주입하는 패턴입니다.])
#glossary-item([Retriever], [질문과 관련된 문서나 청크를 검색해 반환하는 컴포넌트입니다.])
#glossary-item([Embedding], [텍스트를 의미 공간의 벡터로 바꿔 유사도 검색을 가능하게 만드는 표현입니다.])
#glossary-item([Vector store], [임베딩을 저장하고 유사도 검색을 수행하는 저장소입니다.])
#glossary-item([Chunking], [긴 문서를 검색과 컨텍스트 주입에 적합한 작은 단위로 분할하는 작업입니다.])
#glossary-item([SQL Agent], [자연어 질문을 SQL 쿼리로 변환하고 실행 결과를 해석하는 에이전트입니다.])
#glossary-item([Streaming], [모델 응답이나 실행 상태를 완료 전에 점진적으로 전달하는 방식입니다.])
#glossary-item([StreamEvent], [스트리밍 중 전달되는 이벤트 단위입니다. 토큰, 도구 시작/종료, 상태 변경 등이 포함됩니다.])
#glossary-item([TTFT], [Time to First Token의 약자로, 모델이 첫 토큰을 내놓기까지 걸리는 시간입니다.])
#glossary-item([TTFA], [Time to First Audio의 약자로, 보이스 에이전트에서 첫 오디오 출력까지 걸리는 시간입니다.])
#glossary-item([Tracing], [모델 호출, 도구 실행, 상태 전이, 에러를 기록해 실행 흐름을 추적하는 관측 기법입니다.])
#glossary-item([Evaluation], [에이전트 출력 또는 실행 궤적의 품질을 측정하는 과정입니다.])
#glossary-item([LLM-as-Judge], [다른 LLM이 응답 품질이나 실행 결과를 평가자 역할로 채점하는 방식입니다.])
#glossary-item([Trajectory], [에이전트가 최종 답변에 도달하기까지 거친 도구 호출, 중간 추론, 상태 변화의 전체 흐름입니다.])
#glossary-item([Guardrail], [입력·도구·출력 단계에서 안전성, 정책, 품질을 검증하는 제어 장치입니다.])
#glossary-item([PII], [Personally Identifiable Information의 약자로, 이메일·전화번호·주민번호처럼 개인을 식별할 수 있는 민감 정보입니다.])
